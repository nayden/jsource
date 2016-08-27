/* Copyright 1990-2008, Jsoftware Inc.  All rights reserved.               */
/* Licensed use only. Any other use is in violation of copyright.          */
/*                                                                         */
/* Format: ": Monad                                                        */

#include "j.h"

// in fbu.c
extern A RoutineA(J,A);  // convert LIT to C2T/C4T is it contains UTF-8
extern A RoutineB(J,A);  // Convert C2T to C4T if it contains surrogates; install NUL after CJK if result is C2T
extern A RoutineC(J,A);  // instal NUL after CJK characters of C4T
extern A RoutineD(J,A);  // Convert C2T/C4T to UTF-8

#if SY_64
#define WI          21L
#else
#define WI          12L
#endif

#define WD          (9L+NPP)
#define WZ          (WD+WD)
#define FMTF(f,T)   void f(J jt,C*s,T*v)
// Calculate the number of blank lines to leave before a 2-cell of output, depending on how many
// cell boundaries are crossed moving to it
// j = line number in input of the line about to be written
// r=rank of input
// s->shape of input
// exp is expression to use to leave a blank line.  May be executed more than once.
// if j==0 we skip 0 lines - this handles the case of the first line
#define ENGAP(j,r,s,exp)  \
 {I k=1,p=(j),*sr=s+r-2; DO(p?r-1:0, k*=*(sr-i); if(p%k)break; exp); }

static F1(jtthxqe);
static F1(jtthorn1main);

static FMTF(jtfmtI,I){I x=*v;
 sprintf(s,FMTI,x);
 if('-'==*s)*s=CSIGN;
}

static FMTF(jtfmtD,D){B q;C buf[1+WD],c,*t;D x=*v;I k=0;
 if(!memcmp(v,&inf, SZD)){strcpy(s,"_" ); R;}
 if(!memcmp(v,&infm,SZD)){strcpy(s,"__"); R;}
 if(_isnan(*v)          ){strcpy(s,"_."); R;}
 x=*v; x=x==*(D*)minus0?0.0:x;  /* -0 to 0*/
 sprintf(buf,jt->pp,x);
 c=*buf; if(q=c=='-')*s++=CSIGN; q=q||(c=='+');
 if('.'==buf[q])*s++='0';
 MC(s,buf+q,WD+1-q);
 if(t=strchr(s,'e')){
  if('-'==*++t)*t++=CSIGN;
  while(c=*(k+t),c=='0'||c=='+')k++;
  if(k)while(*t=*(k+t))t++;
}}

static FMTF(jtfmtZ,Z){fmtD(s,&v->re); if(v->im){I k=strlen(s); *(k+s)='j'; fmtD(1+k+s,&v->im);}}

static void thcase(I t,I*wd,VF*fmt){
 switch(CTTZ(t)){
  case CMPXX: *wd=WZ; *fmt=jtfmtZ; break;
  case FLX:   *wd=WD; *fmt=jtfmtD; break;
  default:   *wd=WI; *fmt=jtfmtI;
}}

I jtthv(J jt,A w,I n,C*s){A t;B ov=0;C buf[WZ],*x,*y=s;I k,n4=n-4,p,wd,wn,wt;VF fmt;
 RZ(w&&n);
 wn=AN(w); wt=AT(w); x=CAV(w); thcase(wt,&wd,&fmt);
 switch(CTTZNOFLAG(wt)){
  case XNUMX: case RATX:
   RZ(t=thxqe(w)); p=AN(t); if(ov=n<p)p=n4; MC(y,AV(t),p); y+=p; break;
  case B01X:
   if(ov=n<2*wn)p=n4/2; else p=wn; DO(p, *y++=*x++?'1':'0'; *y++=' ';); break;
  case INTX:
	{C*t;I i,*v,x;
	v=AV(w);
    for(i=0;i<wn;++i){
     t=buf; x=*v++;
     sprintf(t,FMTI" ",x);
	 if('-'==*t)*t=CSIGN;
     p=strlen(t); if(ov=n4<p+y-s)break; strcpy(y,t); y+=p;
	}}
   break;
  default:
   k=bp(wt);
   if(n>=wn*wd)DO(wn, fmt(jt,y,x); y+=strlen(y); *y++=' '; x+=k;)
   else        DO(wn, fmt(jt,buf,x); p=strlen(buf); if(ov=n4<1+p+y-s)break; strcpy(y,buf); y+=p; *y++=' '; x+=k;);
 }
 if(ov){if(' '!=*(y-1))*y++=' '; memset(y,'.',3L); y+=3;}
 else if(' '==*(y-1))--y; 
 *y=0; R y-s;
}

static F1(jtthbit){A z;UC*x;C*y;I c,i,m,n,p,q,r,r1,*s;
 n=AN(w); r=AR(w); s=AS(w);
 c=r?s[r-1]:1; m=n/c; p=2*c-1;
 GATV(z,LIT,m*p,r+!r,s); *(AS(z)+AR(z)-1)=p; 
 x=UAV(w); y=CAV(z);
 q=c/BB; r=c%BB; r1=c%BW?(BW-c%BW)/BB:0;
 for(i=0;i<m;++i){
  DO(q-!r, memcpy(y,bitdisp+2*BB**x,2*BB  ); ++x; y+=2*BB  ;);
  if(r)   {memcpy(y,bitdisp+2*BB**x,2*r -1); ++x; y+=2*r -1;}
  else    {memcpy(y,bitdisp+2*BB**x,2*BB-1); ++x; y+=2*BB-1;}
  x+=r1;
 }
 R z;
}

static F1(jtthb){A z;B*x;C*y;I c,m,n,p,r,*s;
 n=AN(w); r=AR(w); s=AS(w);
 c=r?s[r-1]:1; m=n/c; p=2*c-1;
 GATV(z,LIT,m*p,r+!r,s); *(AS(z)+AR(z)-1)=p; 
 x=BAV(w); y=CAV(z);
 DO(m, DO(c-1, *y++=*x++?'1':'0'; *y++=' ';); *y++=*x++?'1':'0';);
 R z;
}

static F1(jtthn){A d,t,z;C*tv,*x,*y,*zv;I c,*dv,k,m,n,p,r,*s,wd;VF fmt;
 n=AN(w); r=AR(w); s=AS(w);
 thcase(AT(w),&wd,&fmt);
 GATV(t,LIT,wd*(1+n),1,0); tv=CAV(t);
 if(1>=r){p=thv(w,AN(t),tv); ASSERTSYS(p,"thn"); AN(t)=*AS(t)=p; z=t;} 
 else{ 
  c=s[r-1]; m=n/c; k=bp(AT(w));
  y=tv-wd; x=CAV(w)-k; 
  RZ(d=apv(c,1L,0L)); dv=AV(d);
  DO(m, DO(c, fmt(jt,y+=wd,x+=k); p=strlen(y); dv[i]=MAX(dv[i],p);););
  --dv[c-1]; p=0; DO(c, p+=++dv[i];);
  GATV(z,LIT,m*p,r+!r,s); *(AS(z)+AR(z)-1)=p; zv=CAV(z); memset(zv,' ',AN(z));
  y=tv; DO(m, DO(c, zv+=dv[i]; p=strlen(y); MC(zv-p-(c>1+i),y,p); y+=wd;););
 }
 R z;
}

static F1(jtthsb){A d,z;C*zv;I c,*dv,m,n,p,q,r,*s;SB*x,*y;SBU*u;
 n=AN(w); r=AR(w); s=AS(w); x=y=SBAV(w); q=jt->sbun;
 if(1>=r){
  c=n; 
  p=2*n-1; DO(c, p+=SBUV(*x++)->n;);
  GATV(z,LIT,  p,1,   0); zv=CAV(z); memset(zv,' ',AN(z));
        DO(c, u=SBUV(*y++); *zv='`'; MC(1+zv,SBSV(u->i),u->n); zv+=2+u->n;);
 }else{
  c=s[r-1]; m=n/c; RZ(d=apv(c,0L,0L)); dv=AV(d);
  DO(m,    DO(c, p =SBUV(*x++)->n; dv[i]=MAX(dv[i],p);););
  p=-1; DO(c, p+=dv[i]+=2;); --dv[c-1];
  GATV(z,LIT,m*p,r+!r,s); zv=CAV(z); memset(zv,' ',AN(z)); *(AS(z)+AR(z)-1)=p;
  DO(m, DO(c, u=SBUV(*y++); *zv='`'; MC(1+zv,SBSV(u->i),u->n); zv+=dv[i];););
 }
 R z;
}

static F1(jtthx1){A z;B b;C*s,s1[2+XBASEN];I n,p,p1,*v;
 n=AN(w); v=AV(w)+n-1; b=0>*v; 
 p=*v; if(p==XPINF)R cstr("_"); else if(p==XNINF)R cstr("__");
 sprintf(s1,FMTI,*v); p1=strlen(s1);
 p=p1+XBASEN*(n-1);
 GATV(z,LIT,p,1,0); s=CAV(z); 
 MC(s,s1,p1); if(b)*s=CSIGN; s+=p1; 
 DO(n-1, --v; sprintf(s,FMTI04,b?-*v:*v); s+=XBASEN;);
 R z;           
}

static A jtthq1(J jt,Q y){A c,d,z;B b;C*zv;I m,n=-1;
 RZ(c=thx1(y.n)); m=AN(c);
 d=y.d;
 if(b=1<AN(d)||1!=*AV(d)){RZ(d=thx1(y.d)); n=AN(d);}
 GATV(z,LIT,m+n+1,1,0); zv=CAV(z);
 MC(zv,AV(c),m); if(b){*(zv+m)='r'; MC(zv+m+1,AV(d),n);}
 R z;
}

static A jtthdx1(J jt,DX y){A x,z;B b;C*s,s1[2+XBASEN],s2[20];I e,n,p,p1,p2,*v;
 e=y.e-1; x=y.x; p=y.p;
 n=AN(x); v=AV(x)+n-1; b=0>*v; 
 if(p==DXINF)R cstr("_"); else if(p==DXMINF)R cstr("__");
 sprintf(s1,FMTI,b?-*v:*v); p1=strlen(s1);
 if(e&&*v){s=s2; *s++='e'; if(0>e)*s++=CSIGN; sprintf(s,FMTI,0<e?e:-e); p2=strlen(s2);}else p2=0; 
 GATV(z,LIT,b+p1+(1<p1)+XBASEN*(n-1)+p2,1,0); s=CAV(z);
 if(b)*s++=CSIGN; *s++=*s1; if(1<p1){*s++='.'; MC(s,1+s1,p1-1); s+=p1-1;}
 DO(n-1, --v; sprintf(s,FMTI04,b?-*v:*v); s+=XBASEN;);
 MC(s,s2,p2);
 R z;
}

static F1(jtthxqe){A d,t,*tv,*v,y,z;C*zv;I c,*dv,m,n,p,r,*s,*wv;
 n=AN(w); r=AR(w); s=AS(w); wv=AV(w);
 c=r?s[r-1]:1; m=n/c;
 GATV(t,BOX,n,1,0); tv=AAV(t);
 RZ(d=apv(c,1L,0L)); dv=AV(d); v=tv;
 switch(CTTZ(AT(w))){
  case XNUMX: {X*u =(X*) wv; DO(m, DO(c, RZ(*v++=y=thx1(*u++));  dv[i]=MAX(dv[i],AN(y));));} break;
  case RATX:  {Q*u =(Q*) wv; DO(m, DO(c, RZ(*v++=y=thq1(*u++));  dv[i]=MAX(dv[i],AN(y));));} break;
#ifdef UNDER_CE
  default: 
   if (AT(w)&XD){DX*u=(DX*)wv; DO(m, DO(c, RZ(*v++=y=thdx1(*u++)); dv[i]=MAX(dv[i],AN(y));));}
   else          {ZX*u=(ZX*)wv; ASSERT(0,EVNONCE);}
   break;
#else
  case XDX:   {DX*u=(DX*)wv; DO(m, DO(c, RZ(*v++=y=thdx1(*u++)); dv[i]=MAX(dv[i],AN(y));));} break;
  case XZX:   {ZX*u=(ZX*)wv; ASSERT(0,EVNONCE);} break;
#endif
 }
 --dv[c-1];
 p=0; DO(c, p+=++dv[i];);
 GATV(z,LIT,m*p,r+!r,s); *(AS(z)+AR(z)-1)=p; zv=CAV(z); memset(zv,' ',AN(z));
 v=tv; DO(m, DO(c, zv+=dv[i]; y=*v++; p=AN(y); MC(zv-p-(c>1+i),AV(y),p);));
 R z;
}

// w is an array of boxes of any shape, where the contents of each box are character tables.
// Output is two lists, one each for x and y, where x[i] is (1+height of largest contents)
// found in row i, and y[j] is (1 + width of largest contents) in column j
// Also return the largest type encountered
// Result is 1 normally, 0 if size out of bounds
static B jtrc(J jt,A w,A*px,A*py, I *t){A*v,x,y;I j=0,k=0,maxt=0,r,*s,xn,*xv,yn,*yv;
 RZ(w);  // return failure if no input
 // r = rank of w, s->shape of w, v->values
 r=AR(w); s=AS(w); v=AAV(w);
 // xn = #rows in 2-cell of joined table, x=vector of (xn+1) 0s, xv->data for vector
 xn=1<r?s[r-2]:1; RZ(*px=x=apv(xn,0L,0L)); xv=AV(x);
 // yn = #rows in 2-cell of joined table, y=vector of (yn+1) 0s, v->data for vector
 yn=  r?s[r-1]:1; RZ(*py=y=apv(yn,0L,0L)); yv=AV(y);
 // for each atom of w, include height/width in the appropriate row/column cells, and take maximum of types
 DO(AN(w), maxt=MAX(maxt,UNSAFE(AT(*v))); s=AS(*v++); xv[j]=MAX(xv[j],s[0]); yv[k]=MAX(yv[k],s[1]); if(++k==yn){k=0; if(++j==xn)j=0;});
 // Add 1 to each max width/height to account for the boxing character before that position
 // We have not yet accounted for the boxing character at the end.
 DO(xn, ASSERT(xv[i]<IMAX,EVLIMIT); ++xv[i];); 
 DO(yn, ASSERT(yv[i]<IMAX,EVLIMIT); ++yv[i];);
 *t=maxt;  // Return maximum type of inputs
 R 1;  // good return
}

// Boxing characters are taken from jt->bx, with interpretation as follows:
// 0-8 are corners, (TMB*3)+(LCR) (Top/Middle/Bottom, Left/Center/Right)
// 9 is vertical bar, 10 is horizontal bar

// Install one row of boxing characters
// cw is 1 if the data is LIT, 2 if C2T
// k is index of boxing character to install at leftmost divider
// n is #boxed values per row
// x[i] is width of column i, including the boxing character
// v->position of first character in some row
static void jtfram(J jt,I k,I n,I*x,C*v,I cw){C a,b=9==k,d,l,r;
 // l = character to install at leftmost divider
 // a = character to install between dividers ('-' normally, but if l=='|', which means we are
 //   formatting the non-divider rows, use space)
 // d = character for middle divider (| if l=='|', otherwise the Center character corresponding to l)
 // r = character for rightmost divider (| if l=='|', otherwise the Right character corresponding to l)
 l=jt->bx[k]; a=b?' ':jt->bx[10]; d=b?l:jt->bx[1+k]; r=b?l:jt->bx[2+k];
 // Install first character; then, for each field, {(width-1) copies of a; then d overwriting last a}
 // then install r over the last d
 // Different version for each character size
 switch (cw){
 case 1:   // version for LIT output array
  {*v++=l; DO(n, memset(v,a,x[i]-1); v+=x[i]-1;*v++=d;);*--v=r;}break;
 case 2: // version for C2T output array
  {US *u=(US*)v;I j; *u++=l; DO(n, for(j=x[i]-1;j>0;--j)*u++=a; *u++=d;); *--u=r;} break;
 case 4: // version for C4T output array
  {C4 *u=(C4*)v;I j; *u++=l; DO(n, for(j=x[i]-1;j>0;--j)*u++=a; *u++=d;); *--u=r;} break;
 }
}

// Install boxing character in all result 2-cells
// m=#result 2-cells
// ht=height of result 2-cell, in characters
// wd=width of result 2-cell, in bytes
// x,y hold height and width or rows & columns respectively (including 1 boxing char)
// zv->first character in first 2-cell
// cw=size of result chars:1=LIT, 2=C2T, 4=C4T
static void jtfminit(J jt,I m,I ht,I wd,A x,A y,C*zv, I cw){C*u,*v;I p,xn,*xv,yn,*yv;
 p=ht*wd;  // p=stride between 2-cells
 xn=AN(x); xv=AV(x);   // xn=#rows per 2-cell, xv->heights
 yn=AN(y); yv=AV(y);   // yn=#cols per 2-cell, yv->widths
 // Install boxing characters into the first result 2-cell
 // First, install the characters for cells containing data.  We start in the first
 // row of the result, even though this can never keep these characters.
 // Then we propagate this row through all rows except the last.
 fram(9L,yn,yv,zv,cw); u=zv; DO(ht-2, MC(u+=wd,zv,wd););
 // Fill in the first interior divider row, whose row index is the height of the first row
 // Then copy this row over all the other interior-divider rows, xn-1 times, which
 //  finishes by writing over the bottom row of the result
 fram(3L,yn,yv,u=v=zv+wd**xv,cw); DO(xn-1, MC(u+=wd*xv[1+i],v,wd););
 // Install the first row, overwriting the data row first put there
 fram(0L,yn,yv,zv,cw);
 // Install the last row, overwriting the interior-divider row first copied there
 fram(6L,yn,yv,zv+p-wd,cw);
 // First 2-cell is complete.  Copy it over all the others
 u=zv; DO(m-1, MC(u+=p,zv,p););
}    /* Initialize with box-drawing characters */

// Copy character data into the boxed result array
// p is #atoms in 2-cell of result
// q is #atoms in 2-cell of input
// wd is width of result 2-cell in bytes
// w is the input: an array of boxes of any shape, where each box holds a table of characters
// x,y  hold height and width or rows & columns respectively (including 1 boxing char).  Each has
//   an extra entry at the end, which we will fill in here
// zv->output area, the first character in the result array (rank>=2)
// cw=size of output character, in bytes 1=LIT 2=C2T 4=C4T
// We go through the boxes one by one, moving the data according to the width/height and centering info
static void jtfmfill(J jt,I p,I q,I wd,A w,A x,A y,C*zv,I cw){A e,*wv;
  I c,d,f,i,j,k,n,r,*s,xn,xp,*xv,yn,yp,*yv;
 // n=#boxes in w, wv->&first box
 n=AN(w); wv=AAV(w);
 // Get centering info for x and y, 012 for MinCenterMax
 xp=jt->pos[0]; yp=jt->pos[1];
 // get xn=# rows, xv->height; & similarly for y
 xn=AN(x); xv=AV(x); yn=AN(y); yv=AV(y);
 // Loop through each box, installing it in the proper position
 // Inside the loop we have
 // j = row number
 // k = column number
 // d = index to top-left corner of output area for the box
 i = 0; d=wd+cw;  // first row/col; d->row 1 col 1  
 while(i<n){
  for(j=0;j<xn;++j){
   for(k=0;k<yn;++k){
    // get info for contents of next box: (r,c) = height,width
    e=wv[i]; s=AS(e); r=s[0]; c=s[1];
    // get offset to store the value at.  First, the vertical calculation.
    // If centering=0, use starting position.  If 2, add (fieldheight-1)-(data height)
    // if 1, add half of that height
    f = xp?(d + wd*((xv[j]-1-r)>>(2-xp))) : d;
    if(yp)f = f + cw*((yv[k]-1-c)>>(2-yp));
    // Move in the data.  If sizes are dissimilar, the target must be larger; do length conversion then
    if(cw==bp(AT(e))){C* v=CAV(e); C* u=zv+f; DO(r, MC(u,v,c*cw); u+=wd; v+=c*cw;)}
    else{  // conversion required
     if(bp(AT(e))==1){UC *v=UAV(e);   // source is bytes
      if(cw==2){   // dest is C2T
       US *u=(US*)(zv+f),*uu; DO(r, uu=u; DO(c,*uu++=*v++;) u=(US*)((UC*)u+wd);)
      }else{   // dest is C4T
       C4 *u=(C4*)(zv+f),*uu; DO(r, uu=u; DO(c,*uu++=*v++;) u=(C4*)((UC*)u+wd);)
      }
     }else{US *v=USAV(e);C4 *u=(C4*)(zv+f),*uu; DO(r, uu=u; DO(c,*uu++=*v++;) u=(C4*)((UC*)u+wd);)}  // must be source is C2T, dest C4T
    }
    ++i;   // step to next input cell
    d += cw*yv[k];  // step to next output column 
   }
   d += wd*(xv[j]-1)+cw;  // d points to start of 2nd line of row; add 1 to get to data char, and then add
                     // height-1 rows to get to next row  
  }
  d += wd;   // d points to first row of next 2-cell: skip over first row, which contains boxing
 }
}   /* fill each cell */

// w is an array of boxes of any shape, where the contents of each box are character tables.
// Result is a character array of rank at least 2.
// Each 2-cell of w contributes one 2-cell to the result; each such
// 2-cell of w is opened and the contents joined to its neighbors, with boxing characters
// installed around it.
// All the 2-cells of the result have boxing characters in the same locations.
static F1(jtenframe){A x,y,z;C*zv;I ht,m,n,p,q,t,wd,wdb,wr,xn,*xv,yn,*yv,zn;
 // Find the positions of the cell boundaries within each 2-cell of the
 // result. x and y are lists, where x[i] and y[j] give the height/width of cell
 // (i,j) of the result 2-cell. This height/width includes the boxing char
 RE(rc(w,&x,&y,&t));
 n=AN(w); wr=MAX(2,AR(w));   // n=#atoms of w, wr=rank of result (2 >. rank of w)
 // Calculate height of result as 1 + sum of row heights.  The 1 is for the final boxing character.
 xn=AN(x); xv=AV(x); ht=1; DO(xn, ht+=xv[i]; ASSERT(0<ht,EVLIMIT););
 // Same for column widths
 yn=AN(y); yv=AV(y); wd=1; DO(yn, wd+=yv[i]; ASSERT(0<wd,EVLIMIT););
 // p=#atoms in result 2-cell, q=#atoms in 2-cell of w, m=#result 2-cells, zn=#atoms in result
 RE(p=mult(ht,wd)); q=MAX(1,xn*yn); m=n/q; RE(zn=mult(m,p));  // in case 2-cells of w are empty, avoid zerodivide.  zn will be 0 then
 // Allocate result area, using max type of the children; initialize shape to shape of w with the last 2 dimensions replaced by (ht,wd) of result 2-cell
 GA(z,t,zn,wr,AS(w)); *(AS(z)+wr-2)=ht; *(AS(z)+wr-1)=wd; 
 if(!n)R z;  // If w has 0 cells, return the empty array
 // Here w has cells.
 zv=CAV(z);  // zv->result area
 wdb=wd*(t=bp(t));  // Replace t with the length of a character of t; get length of line in bytes
 // Install the boxing characters in each 2-cell of the result
 fminit(m,ht,wdb,x,y,zv,t);
 // Insert the data for each atom into the result
 fmfill(p,q,wdb,w,x,y,zv,t);
 R z;
}

// Convert any character array to a table for display
// w is an r-dimensional array of characters; result is a table with
// 1 blank line between 2-cells, 2 blank lines between 3-cells, etc
F1(jtmat){A z;B b=0;C*v,*x;I c,k,m=1,p,q,qc,r,*s,t,zn;
 RZ(w);  // return if no w
 // r=rank of w, s->shape, v->characters, t=type
 r=AR(w); s=AS(w); v=CAV(w); t=AT(w);
 // set (q,c) to the shape of a 2-cell of the input
 q=1<r?s[r-2]:1; c=r?s[r-1]:1;
 // set b=1 if there are 0 2-cells
 DO(r-2, if(!s[i]){b=1; break;});
 // calculate m=# 2-cells, and k=# blank lines to be added
 // At each iteration, we calculate m=#(_1-i)-cells; each boundary between them will add
 // 1 blank line, thus m-1 blanks, for each rank down to 3.  We just accumulate m and initialize
 // by setting k=-(number of ranks checked), thus accounting for all the -1s at once.
 // It is possible to overflow if the 2-cell is empty but the number of 2-cells overflows.
 if(b)k=m=0; else{k=2<r?2-r:0; DO(r-2, RE(m=mult(m,s[i])); k+=m;);}
 // set p=total # lines: number of lines in each 2-cell, plus the added blanks (unless there are no lines to display)
 RE(p=mult(m,q)+k*!!q); RE(zn=mult(p,c));  // zn=total # atoms
 // Allocate the result table, set shape to (p,c); x->data area
 GA(z,t,zn,2,0); *AS(z)=p; *(1+AS(z))=c; x=CAV(z);
 // If the result has gaps, fill the entire result area with fills
 // (this could be better: just copy the gap, as part of ENGAP; check k above in case of leading unit axes)
 if(2<r)fillv(t,zn,x);
 // for each 2-cell, leave a gap if required, then copy in the 2-cell.  Change c to size in bytes; qc=size of 2-cell
 if(zn){c*=bp(t); RE(qc=mult(q,c)); DO(m, ENGAP(i*q,r,s,x+=c;); MC(x,v,qc); x+=qc; v+=qc;);}
 R z;
}

// Convert 1 box to character array, then to character table
static F1(jtmatth1){R mat(thorn1main(w));}

// Format boxed array.  Result is table of characters, with space-changing characters (like BS, CR) converted to spaces
static F1(jtthbox){A z;static UC ctrl[]=" \001\002\003\004\005\006\007   \013\014 ";
 // Format the contents of each box; form into a table.  every returns an array of boxes,
 // with the same shape as w, where the contents have been replaced by a table of characters
 // Then call enframe to assemble all the tables into the result table
 RZ(z=enframe(every(w,0L,jtmatth1)));
 // Go through each byte of the result, replacing ASCII codes 0, 8, 9, 10, and 13
 // (NUL, BS, TAB, LF, CR) with space
 // Three versions of replacement, depending on datatype of the array
 switch(CTTZ(AT(z))){
  case LITX: {UC *s=UAV(z); DO(AN(z), if(14>s[i])s[i]=ctrl[s[i]];);} break; // byte
 // For wide-chars don't replace NUL following >=0x1100, since NUL is used to stand for a zero-width character paired with
 // a double-wide character for spacing purposes.  This NUL will be removed at final output, or for display
  case C2TX: {US *s=USAV(z); DO(AN(z), if(14>s[i]&&(s[i]||!i||s[i-1]<0x1100))s[i]=ctrl[s[i]];);} break;  // wide char
  default: {C4 *s=C4AV(z); DO(AN(z), if(14>s[i]&&(s[i]||!i||s[i-1]<0x1100))s[i]=ctrl[s[i]];);} break;  // must be literal4
 }
 R z;
}

// format sparse array
static F1(jtths){A e,i,x,z;C c,*u,*v;I d,m,n,*s;P*p;
 RZ(scheck(w));
 p=PAV(w); e=SPA(p,e); i=SPA(p,i); x=SPA(p,x); 
 RZ(i=thorn1(i)); s=AS(i); m=s[0]; n=s[1];
 RZ(x=thorn1(1<AR(x)?x:table(x))); 
 RZ(e=shape(x)); s=AV(e)+AN(e)-1; *s=-(*s+3+n);
 RZ(z=take(e,x)); 
 u=CAV(i)-n;        
 d=aii(z); v=CAV(z)-d; DO(m, MC(v+=d,u+=n,n););
 if(2<AR(z))RZ(z=matth1(z));
 s=AS(z); d=*(1+s); v=1+CAV(z); c=jt->bx[9]; DO(*s, *(v+n)=c; v+=d;);
 R z;
}

// ": y, returning character array.  If jt->thornuni is set, LIT and C2T types return
// C2T when there are unicodes present
static F1(jtthorn1main){PROLOG(0001);A z;
 RZ(w);
 if(!AN(w))GATV(z,LIT,0,AR(w),AS(w))
 else switch(CTTZ(AT(w))){
#ifdef UNDER_CE
  default:   if(AT(w)&XD+XZ)z=thxqe(w); else R 0; break;
  case XNUMX: case RATX:
             z=thxqe(w);                  break;
#else
  default:   R 0;
  case XNUMX: case RATX: case XDX: case XZX:
             z=thxqe(w);                  break;
#endif
  case BITX:  z=thbit(w);                  break;
  case B01X:  z=thb(w);                    break;
  case LITX:
   // If we are producing byte output, we simply copy the input.
    // If we are allowed to produce C2T output, do so if the string is a list.  An array of
    // multiple U8 strings is problematic - how do you space them? - and the user should have
    // used C2T if he wanted a perfect result.  What we do (at rank 1) is: check for non-ASCII; if there
    // is any, convert to C2T.  This will make the boxes as small as possible, and will be perfect IF
    // all the characters are UTF-8 of the same length (happens in CJK environments).  If
    // we hit an invalid non-ASCII sequence, abort and keep the original byte string.
    // The conversion to C2T includes appending NUL to double-wide chars, and conversion up to
    // C4T if there are surrogate pairs or codes above U+FFFF
   z=jt->thornuni?rank1ex(w,0L,1L,RoutineA) : ca(w);  // check list for U8 codes, return LIT or C2T
   break;
  case C2TX:
   // If C2T output is allowed, keep it as C2T (it's not worth the time to go through
   // the data to see if conversion to ASCII is feasible - we might just have to expand back to
   // C2T later).  But go through and replace CJK 2-position chars with the original char followed by NUL.
   // This gives each glyph the same number of character codes as display positions, which will make the
   // Resulting array line up without padding.  The NUL characters are suppressed for display, and removed
   // on any conversion back to U8.
   // If there are surrogates, the value returned here might be C4T
   // If C2T output not allowed, convert to ragged array of bytes
   z=jt->thornuni?rank1ex(w,0L,1L,RoutineB) : rank1ex(w,0L,1L,jttoutf8a);
   break;
  case C4TX:
   // If C2T output is allowed, keep this as C4T, but add the padding NUL characters following CJK fullwidth.
   // If C2T output not allowed, just convert to UTF-8 bytes
   z= jt->thornuni?rank1ex(w,0L,1L,RoutineC) : rank1ex(w,0L,1L,jttoutf8a);
   break;
  case BOXX:  z=thbox(w);                  break;
  case SBTX:  z=thsb(w);                   break;
  case NAMEX: z=sfn(0,w);                  break;
  case ASGNX: z=spellout(*CAV(w));         break;
  case INTX:  case FLX: case CMPXX:
             z=thn(w);                    break;
  case SB01X: case SINTX: case SFLX: case SCMPXX: case SLITX: case SBOXX:
             z=ths(w);                    break;
  case VERBX: case ADVX:  case CONJX:
   switch((jt->disp)[1]){
    case 1: z=thorn1main(arep(w)); break;
    case 2: z=thorn1main(drep(w)); break;
    case 4: z=thorn1main(trep(w)); break;
    case 5: z=thorn1main(lrep(w)); break;
    case 6: z=thorn1main(prep(w)); break;
 }}
 EPILOG(z);
}

// entry point to allow C2T result from thorn1.  But always pass byte arguments unchanged
// This will enable null insertion/removal for CJK, but that's OK since the result goes to display
F1(jtthorn1u){ A z; RZ(w); B to = jt->thornuni; jt->thornuni = !(AT(w)&(LIT)); z = thorn1main(w); jt->thornuni = to; R z; }

// entry point for returning LIT array only.  Allow C2T result, then convert.  But always pass literal arguments unchanged
F1(jtthorn1){ A z; RZ(w); B to = jt->thornuni; jt->thornuni = !(AT(w)&(LIT+C2T+C4T)); z = thorn1main(w); if (z&&AT(z)&(C2T+C4T))z = rank1ex(z, 0L, 1L, RoutineD); jt->thornuni = to; R z; }


#define DDD(v)   {*v++='.'; *v++='.'; *v++='.';}
#define EOL(zv)  {zv[0]=eov[0]; zv[1]=eov[1]; zv+=m;}
#define EOLC(zv) {++lc; EOL(zv)}
#define BDC(zv,x)  {if(x<=26&&16<=x){*zv++='\342'; *zv++='\224'; *zv++=bdc[x];}else *zv++=x;}
#define UUC(zv,x)  {if((x)<=127)*zv++=(C)(x);else if((x)<=2047){*zv++=(C)(0xc0+((x)>>6));*zv++=(C)(0x80+((x)&0x3f));}else{*zv++=(C)(0xe0+((x)>>12));*zv++=(C)(0x80+(((x)>>6)&0x3f));*zv++=(C)(0x80+((x)&0x3f));}}
#define UUC4(zv,x)  {if((x)<=127)*zv++=(C)(x);else if((x)<=2047){*zv++=(C)(0xc0+((x)>>6));*zv++=(C)(0x80+((x)&0x3f));}else if((x)<=65535){*zv++=(C)(0xe0+((x)>>12));*zv++=(C)(0x80+(((x)>>6)&0x3f));*zv++=(C)(0x80+((x)&0x3f));} \
else{*zv++=(C)(0xf0+((x)>>18));*zv++=(C)(0x80+(((x)>>12)&0x3f));*zv++=(C)(0x80+(((x)>>6)&0x3f));*zv++=(C)(0x80+((x)&0x3f));}}


// Apply a counting function to the input characters
// Result is a function added up over the characters
// I (*f)() - the counting function
// t = width of character: 1 for byte, 2 for C2T, 4 for C4T
// v->character array
// h = total # lines to output
// nq = # lines in the character array
// c = #characters in an input line
// lb,la # lines to accept at beginning & end
static I countonlines(I (*f)(), I t, C* v, I h, I nq, I c, I lb, I la){
 // if we can output all the lines, go count every character
 if(h>=nq)R (*f)(t,v,c*nq);
 // if we are going to suppress some lines, count the prefix and suffix separately
 R (*f)(t,v,c*lb) + (*f)(t,(v+c*t*(nq-la)),c*la);
}

// count the number of bytes that must be added because of UTF-8 expansion.
// We get a very conservative guess at the number of characters that have to be added
// - we don't stop counting after the line-length limit is reached
// - we add 3 bytes per boxing char when we only have to add 2 (3-byte UTF, but 1 is already accounted for)
// - we don't account for internal EOLs, which reduce the number of lines to process
// t=width of character: 1 for byte, 2 for C2T, 4 for C4T
// v->character array
// n = number of characters to check
static I scanbdc(I t, C*v,I n){C x;I m=0;
 if(t==1) {
  // If the input is bytes, the only added characters can come from boxing codes.  Count them
  DO(n, x=*v; if(x<=26&&16<=x)m+=3; ++v;)
 } else {
  static US bdc[] = { 0,0,0,0,0,0,0,0,0,0, 0,0,0,0,0,0,0x250c,0x252c,0x2510,0x251c, 0x253c,0x2524,0x2514,0x2534,0x2518,0x2502,0x2500 };
  // If the input is C2T/C4T, We count the length of each character.  Also, we convert the boxing codes
  // to their Unicode values here, so we don't have to check again later
  if(t==2){US *u = (US*)v, ux;  // get pointer to wide chars.  Don't analyze as bytes, to be endian-neutral
   DO(n, ux=*u; if(ux<=26&&16<=ux){m+=2;*u=bdc[ux];}else if(ux>127){++m; if(ux>2047)++m;} ++u;)
  }else{C4 *u = (C4*)v, ux;  // get pointer to C4T chars.  Don't analyze as bytes, to be endian-neutral
   DO(n, ux=*u; if(ux<=26&&16<=ux){m+=2;*u=(C4)bdc[ux];}else if(ux>127){++m; if(ux>2047){++m; if(ux>65535)++m;}} ++u;)
  }
 }
 R m;
}
// Count number of interior EOL sequences
// This routine is called only when 2-byte CRLF EOLs are in use.
// Result is # bytes that will be ADDED by converting interior EOLs to CRLF
// NOTE ERROR: if a CRLF sequence straddles a line boundary, it will be counted here
// as a CRLF while it should be counted as 2 separate EOLs.
// t=width of character: 1 for byte, 2 for C2T
// v->character array
// n = number of characters to check
static I scaneol(I t, C*v,I n){I m=0;
 // We look at each character; if CR, we add 1.  If LF, we add 1, unless the
 // previous char was CR: then we subtract 1.  So for CRLF we end up adding nothing, while
 // other occurrences of CR or LF add 1 each.
 switch(t){
  case 1: {C e,x=0; DO(n, e=x; x=*v++; if(x==CCR)++m; else if(x==CLF)e==CCR?--m:++m;)} break;
  case 2: {US e,x=0,*u=(US*)v; DO(n, e=x; x=*u++; if(x==CCR)++m; else if(x==CLF)e==CCR?--m:++m;) } break;
  default: {C4 e,x=0,*u=(C4*)v; DO(n, e=x; x=*u++; if(x==CCR)++m; else if(x==CLF)e==CCR?--m:++m;) } break;  // must be C4T
 }
 R m;
}

// Cut display down to the max size specified by the user
// We know that at least two lines must be deleted
// Input & output are UTF-8 byte strings
// Compacted string result starts at *zu
// Result is &(end+1 of compacted string)
/* zu:  points to start of data area */
/* zv:  points to 1 + end of data area */
/* lb:  # lines before ...             */
/* la:  # lines after  ...             */
/* eol: EOL string (LF\0 or CRLF) */
static C*dropl(C*zu,C*zv,I lb,I la,C*eol){C ec0,ec1,*u,*v;I n,p,zn=zv-zu;
 ec0=eol[0]; ec1=eol[1];
 // count forward until we have passed lb EOLs.  Leave u pointing to the first character
 // after the last EOL.  The loop counter really doesn't matter since we know there are more
 // EOLs in the result than we have room to display
 u=zu; p=0; if(lb){
  DO(zn, if(ec0==*u++&&(ec1==0||ec1==*u))if(++p>=lb)break;);
  u += ec1!=0;  // u points to char after first EOL char; advance, if needed, to the first char of next line
 }
 // count backward until we have passed la+1 EOLs.  Leave v pointing to the first EOL of the suffix
 v=zv-(ec1!=0); p=0; DO(zn, if(ec0==*--v&&(ec1==0||ec1==v[1]))if(++p>la)break;);
 // append ... after the prefix, and then move in the suffix including its leading EOL.
 // But if the amount of data to be removed is less than the length of ..., don't do it, since
 // it would overwrite valid data in the suffix
 // Return pointer to end+1 of the compacted data
 if(v-u>3){DDD(u); n=zv-v; memmove(u,v,n); R u+n;}else R zv;
}    /* drop excessive lines */

// w is any noun, result is a null-terminated string to display for the noun
// We translate box-drawing characters (code 16-26) to Unicode box-drawing characters in UTF-8
// We also add EOL at the ends of lines
// parameters come from 9!:36 (output control)
// ieol is jt->outeol: 0 to end lines with LF, 2 if CRLF
// maxlen is jt->outmaxlen: max length of a line (later chars replaced by ...)
// lb is jt->outmaxbefore: number of leading lines to display
// la is jt->outmaxafter: number of trailing lines to display
static A jtjprx(J jt,I ieol,I maxlen,I lb,I la,A w){A y,z;B ch;C e,eov[2],*v,x,*zu,*zv;D lba;
     I c,c1,h,i,j,k,lc,m,n,nbx,nq,p,q,r,*s,t,zn;
     static C bdc[]="123456789_123456\214\254\220\234\274\244\224\264\230\202\200";
 // Convert w to a character array; set t=1 if it's LIT, t=2 if C2T, 4 if C4T
 RZ(y=thorn1u(w)); t=bp(AT(y));
 // set ch iff input w is a character type.
 ch=1&&AT(w)&LIT+C2T+C4T+SBT;
 // r=rank of result (could be anything), s->shape, v->1st char
 r=AR(y); s=AS(y); v=CAV(y);
 // q=#lines in a 2-cell, c=#chars in a row, n=#2-cells, nq=total # lines (without spacing)
 q=1<r?s[r-2]:1; c=r?s[r-1]:1; RE(n=prod(r-2,s)); RE(nq=mult(n,q));
 // m=length of EOL sequence; *eov=EOL sequence
 if(ieol){m=2; eov[0]=CCR; eov[1]=CLF;}else{m=1; eov[0]=CLF; eov[1]=0;}
 // c1=#characters to put out per line, lba=max # lines to put out
 c1=MIN(c,maxlen); lba=(D)lb+la;
 // calculate p=total # lines of spacing needed, as sum of (#k-cells-1) for k>=2
 p=2<r?2-r:0; h=1; DO(r-2, if(s[i]){h*=s[i]; p+=h;}else{p=0; break;});
 // Set h = max#lines to output, the smaller of (the # before spacing) and (the number we allow)
 h=lba<IMAX?lb+la:IMAX; h=MIN(nq,h);
 // zn=# characters in result string.  Start with enough for '...\n', plus '\n' for each line of spacing,
 // plus, for each line, the max length:
 //   if character type, max line length + '\n' + room for '...\n' to continue the line till all characters are displayed
 //   if other type, max truncated line length + '\n' + '...' if line is truncated
 RE(zn=(3+m)+(q?p*m:0)+mult(h,ch?c+m+(3+m)*(1+c/maxlen):c1+m+3*(c1<c)));
 // If the input was character type, count the number of embedded multiline EOLs, and add a byte for each
 if(ch&&1<m)zn+=countonlines(scaneol,t,v,h,nq,c,lb,la);
 // If the input was character, boxed, or sparse, count the number of bytes that must be added for UTF-8 framing
 if(ch||AT(w)&BOX+SPARSE)zn+=nbx=countonlines(scanbdc,t,v,h,nq,c,lb,la);
 // Now we can allocate the result array.  Set zu,zv->beginning of the data area
 GATV(z,LIT,zn,1,0); zu=zv=CAV(z);
 // h=# beginning lines to output.  If all the lines, including spacing, fit in the user's limit, accept them all; otherwise use the user's starting number
 h=lba<nq+(q?p:0)?lb:IMAX;
 // Loop for each line of output.  lc gives number of lines emitted so far, including ones called for by EOL inside character data
 for(i=lc=0;i<nq;++i){
  // Emit leading EOLs according to number of boundary crossings - only when we cross a 2-cell boundary
  if(0==i%q)ENGAP(i,r,s,EOLC(zv));
  // If we have emitted all the beginning lines, and the suffix isn't big enough to hold all the lines,
  // emit ..., advance v and i to the suffix, and set h so we don't come here again.
  // NOTE this test is imperfect.  The nq>la is needed only because internal EOLs in character data
  // might produce more display lines than we would calculate from the shape; but it doesn't take into account
  // the number of lines already output, or the number of internal EOLs in the suffix lines.  And, if a line
  // contains internal EOLs, they are all emitted, even if they exceed the prefix budget.  If any of this happens,
  // we fix it up at the end
  if(h<=lc&&nq>la){h=IMAX; p=nq-la; v+=c*t*(p-i); i=p-1; DDD(zv);}
  // Otherwise, we emit the line.  If the input was a character type, we have to check for internal newlines
  // Each of these paths must end with the input pointer v advanced to the next input line.  The output is built in *zv
  else if(ch) {
   // Loop for each character of the line.  Convert CR, LF, or CRLF to EOL; discard NUL bytes
   switch(t){
   case 1:
    // Here for LIT characters.  Move em, handling EOL and box-drawing; discard NUL
    for(j=k=x=0;j<c;++j){  // k counts # chars output since last EOL
     e=x; x=*v++;  // prev char, next char
     if     (x==CCR){          EOLC(zv); k=0;}  // if CR, turn into EOL
     else if(x==CLF){if(e!=CCR)EOLC(zv); k=0;}  // if LF not after CR, turn into EOL
     else if(x)     {if(k<c1){BDC(zv,x);} else if(k==c1)DDD(zv); ++k;}  // Otherwise copy the character if not NUL; if it's a boxing character,
               // translate it to UTF8; if it fills the line, install ...
               // apparently there used to be code here to output multiple lines if a string exceeded c1 in length
    }
    break;
   case 2:{US *u=(US*)v,x=0,e;
    // Here for C2T input.  Move em, handling EOL and unicode conversion.  Box-drawing characters have already been converted
    // Discard NUL characters (including ones added after CJK chars)
    for(j=k=0;j<c;++j){
     e=x; x=*u++;
     if     (x==CCR){          EOLC(zv); k=0;}
     else if(x==CLF){if(e!=CCR)EOLC(zv); k=0;} 
     else if(x)     {if(k<c1){UUC(zv,x);} else if(k==c1)DDD(zv); ++k;}
    }
    v=(C*)u;
    }
    break;
   case 4:{C4 *u=(C4*)v,x=0,e;
    // Here for C4T input.  Like C2T
    for(j=k=0;j<c;++j){
     e=x; x=*u++;
     if     (x==CCR){          EOLC(zv); k=0;}
     else if(x==CLF){if(e!=CCR)EOLC(zv); k=0;} 
     else if(x)     {if(k<c1){UUC4(zv,x);} else if(k==c1)DDD(zv); ++k;}
    }
    v=(C*)u;
    }
    break;
   }
  // If input was not character type, it will bnot contain squirrely sequences (boxing will have translated them to spaces),
  // so we copy the first c1 characters and skip over the surplus, appending ... if there is a surplus.
  // But if there are UTF-8 characters in the mix, check each character and translate it if UTF-8
  // No internal newlines are possible unless the original w was character type (in boxes, they were changed to space)
  }else{
   switch(t){
   case 2: {US *u=(US*)v,x;
    // C2T result.  There may be zero-width NULs about - suppress them
    DO(c1, if(x=*u++)UUC(zv,x);); if(c1<c){u+=c-c1; DDD(zv);} v=(C*)u;  // Convert to UTF-8, and save input pointer at the end
    }
    break;
   case 1:
    // LIT characters.  Copy them.  If there were boxing characters about, copy one by one and translate if boxing chars
    // No need to suppress NULs - if the result is LIT, all boxes must have converted to LIT, and would have had NUL converted to space
    if(nbx){DO(c1, x=*v++; BDC(zv,x);); if(c1<c){v+=c-c1; DDD(zv);}}
    // Otherwise just move fast
    else {MC(zv,v,c1); zv+=c1; v+=c1;    if(c1<c){v+=c-c1; DDD(zv);}}
    break;
   default: {C4 *u=(C4*)v,x;
    // C4T result.  There may be zero-width NULs about - suppress them
    DO(c1, if(x=*u++)UUC4(zv,x);); if(c1<c){u+=c-c1; DDD(zv);} v=(C*)u;  // Convert to UTF-8, and save input pointer at the end
    }
    break;
   }
  }
  // One line has been copied to the output area.  Append the final EOL
  EOLC(zv);
 }
 // If there were internal EOLs, it is possible that the result contains more lines than called for in the output
 // control.  We go back through the data now, to get it right.  If we are just one line over, there's no gain from
 // suppressing one line, so let it go
 if(lc>1+lba)zv=dropl(zu,zv,lb,la,eov);
 // Calculate length of result as (end+1)-start
 p=zv-zu; 
 ASSERTSYS(p<=zn,"jprx zn");
 // Null-terminate the string, and set the size and shape of the valid part
 *zv=0; AN(z)=AS(z)[0]=p;
 R z;
}    /* output string from array w */

// 5!:30, to debug formatted display
// a is the output control, (outeol, outmaxlen, outmaxbefore, outmaxafter)
// w is any noun
// Result is the UTF-8 byte string that would be displayed
F2(jtoutstr){I*v;
 RZ(a&&w);
 RZ(a=vib(a));
 ASSERT(1==AR(a), EVRANK);
 ASSERT(4==AN(a), EVLENGTH);
 ASSERT(INT&AT(a),EVDOMAIN);
 v=AV(a);
 ASSERT(0<=v[0]&&v[0]<=2,EVINDEX);
 ASSERT(0<=v[1],EVDOMAIN);
 ASSERT(0<=v[2],EVDOMAIN);
 ASSERT(0<=v[3],EVDOMAIN);
 R jprx(v[0],v[1],v[2],v[3],w);
}

// w is a noun.  Convert it to a UTF-8 string and write it to the console
static F1(jtjpr1){PROLOG(0002);A z;
 // convert the character array to a null-terminated UTF-8 string
 RZ(z=jprx(jt->outeol,jt->outmaxlen,jt->outmaxbefore,jt->outmaxafter,w));
 // write string to stdout, calling it a 'formatted array' unless otherwise overridden
 if(AN(z)){
#ifdef ANDROID
  z=tocesu8(z);
#endif
  jsto(jt,jt->mtyo==0?MTYOFM:jt->mtyo,CAV(z));
 }
 EPILOG(mtm);
}

// w is anything; convert it to character and write it to the display
// if jt->tostdout is clear (for loading scripts quietly), check for errors but produce no output
// Result is 0 if error, otherwise a harmless constant
F1(jtjpr){A y;I i,n,t,*v;
 RZ(w);
 t=AT(w);
  // if w is a noun, format it and output it
 if(t&NOUN&&jt->tostdout)RZ(jpr1(w))
 else if(t&VERB+ADV+CONJ){
  // non-noun result.  If it is the evocation of a name, evaluate the name (unless it is locked - then
  // just use the name)
  RZ(y=evoke(w)?symbrdlock(VAV(w)->f):w);
  if(jt->tostdout){
   // for each representation selected by the user, create the representation and type it
   n=*jt->disp; v=1+jt->disp;
   for(i=0;i<n;++i)switch(*v++){
    case 1: RZ(jpr1(arep(y))); break;
    case 2: RZ(jpr1(drep(y))); break;
    case 4: RZ(jpr1(trep(y))); break;
    case 5: RZ(jpr1(lrep(y))); break;
    case 6: RZ(jpr1(prep(y))); break;
 }}}
 R mtm;
}
