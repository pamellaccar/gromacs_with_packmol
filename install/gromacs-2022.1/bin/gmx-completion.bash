_gmx_anaeig_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-b\n-e\n-dt\n-tu\n-w\n-xvg\n-v\n-v2\n-f\n-s\n-n\n-eig\n-eig2\n-comp\n-rmsf\n-proj\n-2d\n-3d\n-filt\n-extr\n-over\n-inpr\n-first\n-last\n-skip\n-max\n-nframes\n-split\n-entropy\n-temp\n-nevskip' -- $c)); return 0; fi
case "$p" in
-v) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.trr|.cpt|.tng)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-v2) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.trr|.cpt|.tng)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-f) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.xtc|.trr|.cpt|.gro|.g96|.pdb|.tng)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-s) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.tpr|.gro|.g96|.pdb|.brk|.ent)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-n) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.ndx?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-eig) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-eig2) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-comp) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-rmsf) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-proj) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-2d) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-3d) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.gro|.g96|.pdb|.brk|.ent|.esp)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-filt) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.xtc|.trr|.cpt|.gro|.g96|.pdb|.tng)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-extr) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.xtc|.trr|.cpt|.gro|.g96|.pdb|.tng)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-over) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-inpr) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xpm?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_analyze_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-w\n-xvg\n-f\n-ac\n-msd\n-cc\n-dist\n-av\n-ee\n-fitted\n-g\n-notime\n-b\n-e\n-n\n-d\n-bw\n-errbar\n-integrate\n-aver_start\n-xydy\n-regression\n-luzar\n-temp\n-fitstart\n-fitend\n-filter\n-power\n-nosubav\n-oneacf\n-acflen\n-nonormalize\n-P\n-fitfn\n-beginfit\n-endfit' -- $c)); return 0; fi
case "$p" in
-f) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-ac) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-msd) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-cc) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-dist) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-av) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-ee) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-fitted) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-g) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.log?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_angle_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-b\n-e\n-dt\n-w\n-xvg\n-f\n-n\n-od\n-ov\n-of\n-ot\n-oh\n-oc\n-or\n-type\n-all\n-binwidth\n-noperiodic\n-chandler\n-avercorr\n-acflen\n-nonormalize\n-P\n-fitfn\n-beginfit\n-endfit' -- $c)); return 0; fi
case "$p" in
-f) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.xtc|.trr|.cpt|.gro|.g96|.pdb|.tng)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-n) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.ndx?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-od) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-ov) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-of) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-ot) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-oh) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-oc) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-or) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.trr?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_awh_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-b\n-e\n-w\n-xvg\n-f\n-s\n-o\n-fric\n-skip\n-more\n-kt' -- $c)); return 0; fi
case "$p" in
-f) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.edr?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-s) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.tpr?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-o) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-fric) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_bar_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-w\n-xvg\n-f\n-g\n-o\n-oi\n-oh\n-b\n-e\n-temp\n-prec\n-nbmin\n-nbmax\n-nbin\n-extp' -- $c)); return 0; fi
case "$p" in
-f) COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-g) COMPREPLY=( $(compgen -S ' ' -X '!*.edr?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-o) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-oi) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-oh) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_bundle_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-b\n-e\n-dt\n-tu\n-xvg\n-f\n-s\n-n\n-ol\n-od\n-oz\n-ot\n-otr\n-otl\n-ok\n-okr\n-okl\n-oa\n-na\n-z' -- $c)); return 0; fi
case "$p" in
-f) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.xtc|.trr|.cpt|.gro|.g96|.pdb|.tng)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-s) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.tpr|.gro|.g96|.pdb|.brk|.ent)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-n) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.ndx?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-ol) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-od) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-oz) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-ot) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-otr) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-otl) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-ok) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-okr) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-okl) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-oa) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.pdb?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_check_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-f\n-f2\n-s1\n-s2\n-c\n-e\n-e2\n-n\n-m\n-vdwfac\n-bonlo\n-bonhi\n-rmsd\n-tol\n-abstol\n-ab\n-lastener' -- $c)); return 0; fi
case "$p" in
-f) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.xtc|.trr|.cpt|.gro|.g96|.pdb|.tng)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-f2) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.xtc|.trr|.cpt|.gro|.g96|.pdb|.tng)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-s1) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.tpr?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-s2) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.tpr?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-c) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.tpr|.gro|.g96|.pdb|.brk|.ent)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-e) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.edr?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-e2) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.edr?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-n) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.ndx?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-m) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.tex?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_chi_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-b\n-e\n-dt\n-w\n-xvg\n-s\n-f\n-o\n-p\n-ss\n-jc\n-corr\n-g\n-ot\n-oh\n-rt\n-cp\n-r0\n-phi\n-psi\n-omega\n-rama\n-viol\n-noperiodic\n-all\n-rad\n-shift\n-binwidth\n-core_rotamer\n-maxchi\n-nonormhisto\n-ramomega\n-bfact\n-chi_prod\n-HChi\n-bmax\n-acflen\n-nonormalize\n-P\n-fitfn\n-beginfit\n-endfit' -- $c)); return 0; fi
case "$p" in
-s) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.gro|.g96|.pdb|.brk|.ent|.esp|.tpr)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-f) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.xtc|.trr|.cpt|.gro|.g96|.pdb|.tng)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-o) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-p) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.pdb?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-ss) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.dat?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-jc) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-corr) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-g) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.log?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-ot) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-oh) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-rt) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-cp) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_cluster_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-b\n-e\n-dt\n-tu\n-w\n-xvg\n-f\n-s\n-n\n-dm\n-om\n-o\n-g\n-dist\n-ev\n-conv\n-sz\n-tr\n-ntr\n-clid\n-cl\n-clndx\n-dista\n-nlevels\n-cutoff\n-nofit\n-max\n-skip\n-av\n-wcl\n-nst\n-rmsmin\n-method\n-minstruct\n-binary\n-M\n-P\n-seed\n-niter\n-nrandom\n-kT\n-nopbc' -- $c)); return 0; fi
case "$p" in
-f) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.xtc|.trr|.cpt|.gro|.g96|.pdb|.tng)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-s) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.tpr|.gro|.g96|.pdb|.brk|.ent)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-n) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.ndx?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-dm) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xpm?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-om) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xpm?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-o) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xpm?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-g) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.log?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-dist) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-ev) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-conv) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-sz) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-tr) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xpm?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-ntr) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-clid) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-cl) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.xtc|.trr|.cpt|.gro|.g96|.pdb|.tng)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-clndx) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.ndx?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_clustsize_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-b\n-e\n-dt\n-tu\n-w\n-xvg\n-f\n-s\n-n\n-o\n-ow\n-nc\n-mc\n-ac\n-hc\n-temp\n-mcn\n-cut\n-mol\n-nopbc\n-nskip\n-nlevels\n-ndf\n-rgblo\n-rgbhi' -- $c)); return 0; fi
case "$p" in
-f) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.xtc|.trr|.cpt|.gro|.g96|.pdb|.tng)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-s) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.tpr?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-n) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.ndx?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-o) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xpm?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-ow) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xpm?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-nc) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-mc) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-ac) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-hc) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-temp) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-mcn) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.ndx?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_confrms_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-w\n-f1\n-f2\n-o\n-n1\n-n2\n-no\n-one\n-nomw\n-pbc\n-nofit\n-name\n-label\n-bfac' -- $c)); return 0; fi
case "$p" in
-f1) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.tpr|.gro|.g96|.pdb|.brk|.ent)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-f2) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.gro|.g96|.pdb|.brk|.ent|.esp|.tpr)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-o) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.gro|.g96|.pdb|.brk|.ent|.esp)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-n1) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.ndx?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-n2) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.ndx?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-no) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.ndx?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_convert_tpr_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-s\n-n\n-o\n-extend\n-until\n-nsteps\n-zeroq' -- $c)); return 0; fi
case "$p" in
-s) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.tpr|.gro|.g96|.pdb|.brk|.ent)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-n) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.ndx?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-o) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.tpr|.gro|.g96|.pdb|.brk|.ent)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_convert_trj_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-f\n-s\n-b\n-e\n-dt\n-tu\n-fgroup\n-xvg\n-normpbc\n-nopbc\n-n\n-sf\n-selrpos\n-select\n-o\n-vel\n-force\n-atoms\n-precision\n-starttime\n-timestep\n-box' -- $c)); return 0; fi
case "$p" in
-f) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.xtc|.trr|.cpt|.gro|.g96|.pdb|.tng)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-s) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.tpr|.gro|.g96|.pdb|.brk|.ent)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-n) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.ndx?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-selrpos) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -W $'atom\nres_com\nres_cog\nmol_com\nmol_cog\nwhole_res_com\nwhole_res_cog\nwhole_mol_com\nwhole_mol_cog\npart_res_com\npart_res_cog\npart_mol_com\npart_mol_cog\ndyn_res_com\ndyn_res_cog\ndyn_mol_com\ndyn_mol_cog' -- $c));;
-o) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.xtc|.trr|.cpt|.gro|.g96|.pdb|.tng)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_covar_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-b\n-e\n-dt\n-tu\n-xvg\n-f\n-s\n-n\n-o\n-v\n-av\n-l\n-ascii\n-xpm\n-xpma\n-nofit\n-ref\n-mwa\n-last\n-nopbc' -- $c)); return 0; fi
case "$p" in
-f) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.xtc|.trr|.cpt|.gro|.g96|.pdb|.tng)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-s) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.tpr|.gro|.g96|.pdb|.brk|.ent)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-n) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.ndx?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-o) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-v) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.trr|.cpt|.tng)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-av) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.gro|.g96|.pdb|.brk|.ent|.esp)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-l) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.log?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-ascii) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.dat?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-xpm) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xpm?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-xpma) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xpm?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_current_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-b\n-e\n-dt\n-w\n-xvg\n-s\n-n\n-f\n-o\n-caf\n-dsp\n-md\n-mj\n-mc\n-sh\n-nonojump\n-eps\n-bfit\n-efit\n-bvit\n-evit\n-temp' -- $c)); return 0; fi
case "$p" in
-s) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.tpr|.gro|.g96|.pdb|.brk|.ent)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-n) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.ndx?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-f) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.xtc|.trr|.cpt|.gro|.g96|.pdb|.tng)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-o) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-caf) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-dsp) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-md) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-mj) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-mc) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_density_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-b\n-e\n-dt\n-w\n-xvg\n-f\n-n\n-s\n-ei\n-o\n-d\n-sl\n-dens\n-ng\n-center\n-symm' -- $c)); return 0; fi
case "$p" in
-f) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.xtc|.trr|.cpt|.gro|.g96|.pdb|.tng)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-n) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.ndx?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-s) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.tpr?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-ei) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.dat?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-o) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_densmap_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-b\n-e\n-dt\n-w\n-f\n-s\n-n\n-od\n-o\n-bin\n-aver\n-xmin\n-xmax\n-n1\n-n2\n-amax\n-rmax\n-mirror\n-sums\n-unit\n-dmin\n-dmax' -- $c)); return 0; fi
case "$p" in
-f) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.xtc|.trr|.cpt|.gro|.g96|.pdb|.tng)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-s) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.tpr|.gro|.g96|.pdb|.brk|.ent)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-n) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.ndx?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-od) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.dat?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-o) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xpm?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_densorder_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-b\n-e\n-dt\n-w\n-s\n-f\n-n\n-o\n-or\n-og\n-Spect\n-1d\n-bw\n-bwn\n-order\n-axis\n-method\n-d1\n-d2\n-tblock\n-nlevel' -- $c)); return 0; fi
case "$p" in
-s) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.tpr?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-f) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.xtc|.trr|.cpt|.gro|.g96|.pdb|.tng)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-n) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.ndx?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-o) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.dat?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-or) COMPREPLY=( $(compgen -S ' ' -X '!*.out?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-og) COMPREPLY=( $(compgen -S ' ' -X '!*.xpm?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-Spect) COMPREPLY=( $(compgen -S ' ' -X '!*.out?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_dielectric_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-b\n-e\n-dt\n-w\n-xvg\n-f\n-d\n-o\n-c\n-nox1\n-eint\n-bfit\n-efit\n-tail\n-A\n-tau1\n-tau2\n-eps0\n-epsRF\n-fix\n-ffn\n-nsmooth' -- $c)); return 0; fi
case "$p" in
-f) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-d) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-o) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-c) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_dipoles_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-b\n-e\n-dt\n-w\n-xvg\n-en\n-f\n-s\n-n\n-o\n-eps\n-a\n-d\n-c\n-g\n-adip\n-dip3d\n-cos\n-cmap\n-slab\n-mu\n-mumax\n-epsilonRF\n-skip\n-temp\n-corr\n-nopairs\n-quad\n-ncos\n-axis\n-sl\n-gkratom\n-gkratom2\n-rcmax\n-phi\n-nlevels\n-ndegrees\n-acflen\n-nonormalize\n-P\n-fitfn\n-beginfit\n-endfit' -- $c)); return 0; fi
case "$p" in
-en) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.edr?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-f) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.xtc|.trr|.cpt|.gro|.g96|.pdb|.tng)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-s) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.tpr?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-n) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.ndx?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-o) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-eps) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-a) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-d) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-c) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-g) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-adip) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-dip3d) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-cos) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-cmap) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xpm?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-slab) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_disre_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-b\n-e\n-dt\n-w\n-xvg\n-s\n-f\n-ds\n-da\n-dn\n-dm\n-dr\n-l\n-n\n-q\n-c\n-x\n-ntop\n-maxdr\n-nlevels\n-nothird' -- $c)); return 0; fi
case "$p" in
-s) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.tpr?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-f) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.xtc|.trr|.cpt|.gro|.g96|.pdb|.tng)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-ds) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-da) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-dn) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-dm) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-dr) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-l) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.log?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-n) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.ndx?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-q) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.pdb?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-c) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.ndx?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-x) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xpm?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_distance_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-f\n-s\n-b\n-e\n-dt\n-tu\n-fgroup\n-xvg\n-normpbc\n-nopbc\n-n\n-sf\n-selrpos\n-seltype\n-oav\n-oall\n-oxyz\n-oh\n-oallstat\n-select\n-len\n-tol\n-binw' -- $c)); return 0; fi
case "$p" in
-f) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.xtc|.trr|.cpt|.gro|.g96|.pdb|.tng)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-s) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.tpr|.gro|.g96|.pdb|.brk|.ent)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-n) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.ndx?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-selrpos) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -W $'atom\nres_com\nres_cog\nmol_com\nmol_cog\nwhole_res_com\nwhole_res_cog\nwhole_mol_com\nwhole_mol_cog\npart_res_com\npart_res_cog\npart_mol_com\npart_mol_cog\ndyn_res_com\ndyn_res_cog\ndyn_mol_com\ndyn_mol_cog' -- $c));;
-seltype) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -W $'atom\nres_com\nres_cog\nmol_com\nmol_cog\nwhole_res_com\nwhole_res_cog\nwhole_mol_com\nwhole_mol_cog\npart_res_com\npart_res_cog\npart_mol_com\npart_mol_cog\ndyn_res_com\ndyn_res_cog\ndyn_mol_com\ndyn_mol_cog' -- $c));;
-oav) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-oall) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-oxyz) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-oh) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-oallstat) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_do_dssp_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-b\n-e\n-dt\n-tu\n-w\n-xvg\n-f\n-s\n-n\n-ssdump\n-map\n-o\n-sc\n-a\n-ta\n-aa\n-sss\n-ver' -- $c)); return 0; fi
case "$p" in
-f) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.xtc|.trr|.cpt|.gro|.g96|.pdb|.tng)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-s) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.tpr|.gro|.g96|.pdb|.brk|.ent)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-n) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.ndx?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-ssdump) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.dat?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-map) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.map?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-o) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xpm?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-sc) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-a) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xpm?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-ta) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-aa) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_dos_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-b\n-e\n-dt\n-w\n-xvg\n-f\n-s\n-n\n-vacf\n-mvacf\n-dos\n-g\n-nov\n-recip\n-abs\n-normdos\n-T\n-toler\n-acflen\n-nonormalize\n-P\n-fitfn\n-beginfit\n-endfit' -- $c)); return 0; fi
case "$p" in
-f) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.trr|.cpt|.tng)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-s) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.tpr?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-n) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.ndx?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-vacf) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-mvacf) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-dos) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-g) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.log?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_dump_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-s\n-f\n-e\n-cp\n-p\n-mtx\n-om\n-nonr\n-param\n-sys\n-orgir' -- $c)); return 0; fi
case "$p" in
-s) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.tpr?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-f) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.xtc|.trr|.cpt|.gro|.g96|.pdb|.tng)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-e) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.edr?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-cp) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.cpt?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-p) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.top?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-mtx) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.mtx?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-om) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.mdp?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_dyecoupl_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-b\n-e\n-tu\n-w\n-xvg\n-f\n-n\n-ot\n-oe\n-o\n-rhist\n-khist\n-pbcdist\n-norm\n-bins\n-R0' -- $c)); return 0; fi
case "$p" in
-f) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.xtc|.trr|.cpt|.gro|.g96|.pdb|.tng)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-n) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.ndx?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-ot) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-oe) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-o) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.dat?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-rhist) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-khist) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_editconf_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-w\n-f\n-n\n-o\n-mead\n-bf\n-ndef\n-bt\n-box\n-angles\n-d\n-c\n-center\n-aligncenter\n-align\n-translate\n-rotate\n-princ\n-scale\n-density\n-pbc\n-resnr\n-grasp\n-rvdw\n-sig56\n-vdwread\n-atom\n-legend\n-label\n-conect' -- $c)); return 0; fi
case "$p" in
-f) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.gro|.g96|.pdb|.brk|.ent|.esp|.tpr)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-n) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.ndx?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-o) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.gro|.g96|.pdb|.brk|.ent|.esp)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-mead) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.pqr?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-bf) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.dat?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_eneconv_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-f\n-o\n-b\n-e\n-dt\n-offset\n-settime\n-nosort\n-rmdh\n-scalefac\n-noerror' -- $c)); return 0; fi
case "$p" in
-f) COMPREPLY=( $(compgen -S ' ' -X '!*.edr?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-o) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.edr?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_enemat_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-b\n-e\n-dt\n-w\n-xvg\n-f\n-groups\n-eref\n-emat\n-etot\n-sum\n-skip\n-nomean\n-nlevels\n-max\n-min\n-nocoulsr\n-coul14\n-noljsr\n-lj14\n-bhamsr\n-nofree\n-temp' -- $c)); return 0; fi
case "$p" in
-f) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.edr?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-groups) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.dat?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-eref) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.dat?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-emat) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xpm?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-etot) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_energy_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-b\n-e\n-w\n-xvg\n-f\n-f2\n-s\n-o\n-viol\n-pairs\n-corr\n-vis\n-evisco\n-eviscoi\n-ravg\n-odh\n-fee\n-fetemp\n-zero\n-sum\n-dp\n-nbmin\n-nbmax\n-mutot\n-aver\n-nmol\n-fluct_props\n-driftcorr\n-fluc\n-orinst\n-ovec\n-acflen\n-nonormalize\n-P\n-fitfn\n-beginfit\n-endfit' -- $c)); return 0; fi
case "$p" in
-f) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.edr?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-f2) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.edr?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-s) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.tpr?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-o) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-viol) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-pairs) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-corr) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-vis) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-evisco) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-eviscoi) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-ravg) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-odh) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_extract_cluster_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-f\n-s\n-b\n-e\n-dt\n-tu\n-fgroup\n-xvg\n-normpbc\n-nopbc\n-n\n-sf\n-selrpos\n-clusters\n-select\n-o\n-vel\n-force\n-atoms\n-precision\n-starttime\n-timestep\n-box' -- $c)); return 0; fi
case "$p" in
-f) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.xtc|.trr|.cpt|.gro|.g96|.pdb|.tng)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-s) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.tpr|.gro|.g96|.pdb|.brk|.ent)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-n) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.ndx?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-selrpos) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -W $'atom\nres_com\nres_cog\nmol_com\nmol_cog\nwhole_res_com\nwhole_res_cog\nwhole_mol_com\nwhole_mol_cog\npart_res_com\npart_res_cog\npart_mol_com\npart_mol_cog\ndyn_res_com\ndyn_res_cog\ndyn_mol_com\ndyn_mol_cog' -- $c));;
-clusters) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.ndx?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-o) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.xtc|.trr|.cpt|.gro|.g96|.pdb|.tng)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_filter_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-b\n-e\n-dt\n-w\n-f\n-s\n-n\n-ol\n-oh\n-nf\n-all\n-nonojump\n-fit' -- $c)); return 0; fi
case "$p" in
-f) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.xtc|.trr|.cpt|.gro|.g96|.pdb|.tng)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-s) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.tpr|.gro|.g96|.pdb|.brk|.ent)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-n) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.ndx?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-ol) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.xtc|.trr|.gro|.g96|.pdb|.tng)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-oh) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.xtc|.trr|.gro|.g96|.pdb|.tng)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_freevolume_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-f\n-s\n-b\n-e\n-dt\n-tu\n-fgroup\n-xvg\n-normpbc\n-n\n-sf\n-selrpos\n-o\n-select\n-radius\n-seed\n-ninsert' -- $c)); return 0; fi
case "$p" in
-f) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.xtc|.trr|.cpt|.gro|.g96|.pdb|.tng)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-s) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.tpr|.gro|.g96|.pdb|.brk|.ent)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-n) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.ndx?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-selrpos) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -W $'atom\nres_com\nres_cog\nmol_com\nmol_cog\nwhole_res_com\nwhole_res_cog\nwhole_mol_com\nwhole_mol_cog\npart_res_com\npart_res_cog\npart_mol_com\npart_mol_cog\ndyn_res_com\ndyn_res_cog\ndyn_mol_com\ndyn_mol_cog' -- $c));;
-o) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_gangle_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-f\n-s\n-b\n-e\n-dt\n-tu\n-fgroup\n-xvg\n-normpbc\n-nopbc\n-n\n-sf\n-selrpos\n-seltype\n-oav\n-oall\n-oh\n-g1\n-g2\n-binw\n-group1\n-group2' -- $c)); return 0; fi
case "$p" in
-f) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.xtc|.trr|.cpt|.gro|.g96|.pdb|.tng)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-s) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.tpr|.gro|.g96|.pdb|.brk|.ent)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-n) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.ndx?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-selrpos) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -W $'atom\nres_com\nres_cog\nmol_com\nmol_cog\nwhole_res_com\nwhole_res_cog\nwhole_mol_com\nwhole_mol_cog\npart_res_com\npart_res_cog\npart_mol_com\npart_mol_cog\ndyn_res_com\ndyn_res_cog\ndyn_mol_com\ndyn_mol_cog' -- $c));;
-seltype) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -W $'atom\nres_com\nres_cog\nmol_com\nmol_cog\nwhole_res_com\nwhole_res_cog\nwhole_mol_com\nwhole_mol_cog\npart_res_com\npart_res_cog\npart_mol_com\npart_mol_cog\ndyn_res_com\ndyn_res_cog\ndyn_mol_com\ndyn_mol_cog' -- $c));;
-oav) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-oall) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-oh) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_genconf_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-f\n-o\n-trj\n-nbox\n-dist\n-seed\n-rot\n-maxrot\n-norenumber' -- $c)); return 0; fi
case "$p" in
-f) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.gro|.g96|.pdb|.brk|.ent|.esp|.tpr)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-o) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.gro|.g96|.pdb|.brk|.ent|.esp)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-trj) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.xtc|.trr|.cpt|.gro|.g96|.pdb|.tng)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_genion_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-s\n-n\n-o\n-p\n-np\n-pname\n-pq\n-nn\n-nname\n-nq\n-rmin\n-seed\n-conc\n-neutral' -- $c)); return 0; fi
case "$p" in
-s) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.tpr?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-n) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.ndx?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-o) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.gro|.g96|.pdb|.brk|.ent|.esp)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-p) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.top?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_genrestr_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-f\n-n\n-o\n-of\n-fc\n-freeze\n-disre\n-disre_dist\n-disre_frac\n-disre_up2\n-cutoff\n-constr' -- $c)); return 0; fi
case "$p" in
-f) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.gro|.g96|.pdb|.brk|.ent|.esp|.tpr)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-n) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.ndx?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-o) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.itp?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-of) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.ndx?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_grompp_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-f\n-po\n-c\n-r\n-rb\n-n\n-p\n-pp\n-o\n-t\n-e\n-imd\n-ref\n-qmi\n-v\n-time\n-normvsbds\n-maxwarn\n-zero\n-norenum' -- $c)); return 0; fi
case "$p" in
-f) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.mdp?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-po) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.mdp?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-c) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.gro|.g96|.pdb|.brk|.ent|.esp|.tpr)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-r) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.gro|.g96|.pdb|.brk|.ent|.esp|.tpr)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-rb) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.gro|.g96|.pdb|.brk|.ent|.esp|.tpr)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-n) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.ndx?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-p) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.top?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-pp) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.top?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-o) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.tpr?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-t) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.trr|.cpt|.tng)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-e) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.edr?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-imd) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.gro?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-ref) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.trr|.cpt|.tng)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-qmi) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.inp?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_gyrate_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-b\n-e\n-dt\n-w\n-xvg\n-f\n-s\n-n\n-o\n-acf\n-nmol\n-q\n-p\n-moi\n-nz\n-acflen\n-nonormalize\n-P\n-fitfn\n-beginfit\n-endfit' -- $c)); return 0; fi
case "$p" in
-f) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.xtc|.trr|.cpt|.gro|.g96|.pdb|.tng)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-s) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.tpr|.gro|.g96|.pdb|.brk|.ent)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-n) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.ndx?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-o) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-acf) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_h2order_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-b\n-e\n-dt\n-w\n-xvg\n-f\n-n\n-nm\n-s\n-o\n-d\n-sl' -- $c)); return 0; fi
case "$p" in
-f) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.xtc|.trr|.cpt|.gro|.g96|.pdb|.tng)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-n) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.ndx?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-nm) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.ndx?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-s) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.tpr?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-o) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_hbond_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-b\n-e\n-dt\n-tu\n-xvg\n-f\n-s\n-n\n-num\n-g\n-ac\n-dist\n-ang\n-hx\n-hbn\n-hbm\n-don\n-dan\n-life\n-nhbdist\n-a\n-r\n-noda\n-r2\n-abin\n-rbin\n-nonitacc\n-contact\n-shell\n-fitstart\n-fitend\n-temp\n-dump\n-max_hb\n-nomerge\n-acflen\n-nonormalize\n-P\n-fitfn\n-beginfit\n-endfit' -- $c)); return 0; fi
case "$p" in
-f) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.xtc|.trr|.cpt|.gro|.g96|.pdb|.tng)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-s) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.tpr?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-n) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.ndx?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-num) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-g) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.log?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-ac) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-dist) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-ang) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-hx) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-hbn) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.ndx?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-hbm) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xpm?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-don) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-dan) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-life) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-nhbdist) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_helix_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-b\n-e\n-dt\n-w\n-s\n-n\n-f\n-cz\n-r0\n-q\n-noF\n-db\n-ev\n-ahxstart\n-ahxend' -- $c)); return 0; fi
case "$p" in
-s) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.tpr?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-n) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.ndx?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-f) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.xtc|.trr|.cpt|.gro|.g96|.pdb|.tng)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-cz) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.gro|.g96|.pdb|.brk|.ent|.esp)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_helixorient_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-b\n-e\n-dt\n-xvg\n-s\n-f\n-n\n-oaxis\n-ocenter\n-orise\n-oradius\n-otwist\n-obending\n-otilt\n-orot\n-sidechain\n-incremental' -- $c)); return 0; fi
case "$p" in
-s) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.tpr?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-f) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.xtc|.trr|.cpt|.gro|.g96|.pdb|.tng)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-n) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.ndx?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-oaxis) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.dat?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-ocenter) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.dat?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-orise) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-oradius) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-otwist) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-obending) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-otilt) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-orot) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_hydorder_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-b\n-e\n-dt\n-w\n-f\n-n\n-s\n-o\n-or\n-Spect\n-d\n-bw\n-sgang1\n-sgang2\n-tblock\n-nlevel' -- $c)); return 0; fi
case "$p" in
-f) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.xtc|.trr|.cpt|.gro|.g96|.pdb|.tng)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-n) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.ndx?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-s) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.tpr?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-o) COMPREPLY=( $(compgen -S ' ' -X '!*.xpm?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-or) COMPREPLY=( $(compgen -S ' ' -X '!*.out?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-Spect) COMPREPLY=( $(compgen -S ' ' -X '!*.out?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_insert_molecules_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-f\n-ci\n-ip\n-o\n-replace\n-n\n-sf\n-selrpos\n-box\n-nmol\n-try\n-seed\n-radius\n-scale\n-dr\n-rot' -- $c)); return 0; fi
case "$p" in
-f) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.gro|.g96|.pdb|.brk|.ent|.esp|.tpr)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-ci) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.gro|.g96|.pdb|.brk|.ent|.esp|.tpr)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-ip) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.dat?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-o) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.gro|.g96|.pdb|.brk|.ent|.esp)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-n) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.ndx?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-selrpos) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -W $'atom\nres_com\nres_cog\nmol_com\nmol_cog\nwhole_res_com\nwhole_res_cog\nwhole_mol_com\nwhole_mol_cog\npart_res_com\npart_res_cog\npart_mol_com\npart_mol_cog\ndyn_res_com\ndyn_res_cog\ndyn_mol_com\ndyn_mol_cog' -- $c));;
esac }
_gmx_lie_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-b\n-e\n-dt\n-w\n-xvg\n-f\n-o\n-Elj\n-Eqq\n-Clj\n-Cqq\n-ligand' -- $c)); return 0; fi
case "$p" in
-f) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.edr?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-o) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_make_edi_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-xvg\n-f\n-eig\n-s\n-n\n-tar\n-ori\n-o\n-mon\n-linfix\n-linacc\n-radfix\n-radacc\n-radcon\n-flood\n-outfrq\n-slope\n-linstep\n-accdir\n-radstep\n-maxedsteps\n-eqsteps\n-deltaF0\n-deltaF\n-tau\n-Eflnull\n-T\n-alpha\n-restrain\n-hessian\n-harmonic\n-constF' -- $c)); return 0; fi
case "$p" in
-f) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.trr|.cpt|.tng)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-eig) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-s) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.tpr|.gro|.g96|.pdb|.brk|.ent)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-n) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.ndx?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-tar) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.gro|.g96|.pdb|.brk|.ent|.esp|.tpr)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-ori) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.gro|.g96|.pdb|.brk|.ent|.esp|.tpr)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-o) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.edi?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_make_ndx_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-f\n-n\n-o\n-natoms\n-twin' -- $c)); return 0; fi
case "$p" in
-f) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.gro|.g96|.pdb|.brk|.ent|.esp|.tpr)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-n) COMPREPLY=( $(compgen -S ' ' -X '!*.ndx?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-o) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.ndx?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_mdmat_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-b\n-e\n-dt\n-xvg\n-f\n-s\n-n\n-mean\n-frames\n-no\n-t\n-nlevels' -- $c)); return 0; fi
case "$p" in
-f) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.xtc|.trr|.cpt|.gro|.g96|.pdb|.tng)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-s) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.tpr|.gro|.g96|.pdb|.brk|.ent)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-n) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.ndx?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-mean) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xpm?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-frames) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xpm?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-no) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_mdrun_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-deffnm\n-xvg\n-s\n-o\n-x\n-cpi\n-cpo\n-c\n-e\n-g\n-dhdl\n-field\n-table\n-tablep\n-tableb\n-rerun\n-tpi\n-tpid\n-ei\n-eo\n-px\n-pf\n-ro\n-ra\n-rs\n-rt\n-mtx\n-multidir\n-awh\n-membed\n-mp\n-mn\n-if\n-swap\n-dd\n-ddorder\n-npme\n-nt\n-ntmpi\n-ntomp\n-ntomp_pme\n-pin\n-pinoffset\n-pinstride\n-gpu_id\n-gputasks\n-noddcheck\n-rdd\n-rcon\n-dlb\n-dds\n-nb\n-nstlist\n-notunepme\n-pme\n-pmefft\n-bonded\n-update\n-v\n-pforce\n-reprod\n-cpt\n-cpnum\n-noappend\n-nsteps\n-maxh\n-replex\n-nex\n-reseed' -- $c)); return 0; fi
case "$p" in
-s) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.tpr?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-o) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.trr|.cpt|.tng)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-x) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.xtc|.tng)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-cpi) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.cpt?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-cpo) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.cpt?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-c) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.gro|.g96|.pdb|.brk|.ent|.esp)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-e) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.edr?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-g) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.log?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-dhdl) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-field) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-table) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-tablep) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-tableb) COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-rerun) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.xtc|.trr|.cpt|.gro|.g96|.pdb|.tng)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-tpi) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-tpid) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-ei) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.edi?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-eo) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-px) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-pf) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-ro) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-ra) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.log?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-rs) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.log?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-rt) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.log?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-mtx) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.mtx?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-multidir) COMPREPLY=( $(compgen -S ' ' -d $c));;
-awh) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-membed) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.dat?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-mp) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.top?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-mn) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.ndx?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-if) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-swap) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_mindist_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-b\n-e\n-dt\n-tu\n-w\n-xvg\n-f\n-s\n-n\n-od\n-on\n-o\n-ox\n-or\n-matrix\n-max\n-d\n-group\n-pi\n-split\n-ng\n-nopbc\n-respertime\n-printresname' -- $c)); return 0; fi
case "$p" in
-f) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.xtc|.trr|.cpt|.gro|.g96|.pdb|.tng)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-s) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.tpr|.gro|.g96|.pdb|.brk|.ent)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-n) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.ndx?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-od) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-on) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-o) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.out?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-ox) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.xtc|.trr|.gro|.g96|.pdb|.tng)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-or) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_mk_angndx_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-s\n-n\n-type\n-nohyd\n-hq' -- $c)); return 0; fi
case "$p" in
-s) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.tpr?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-n) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.ndx?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_msd_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-f\n-s\n-b\n-e\n-dt\n-tu\n-fgroup\n-xvg\n-normpbc\n-nopbc\n-n\n-sf\n-selrpos\n-seltype\n-sel\n-type\n-lateral\n-trestart\n-maxtau\n-beginfit\n-endfit\n-o\n-mol' -- $c)); return 0; fi
case "$p" in
-f) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.xtc|.trr|.cpt|.gro|.g96|.pdb|.tng)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-s) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.tpr|.gro|.g96|.pdb|.brk|.ent)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-n) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.ndx?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-selrpos) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -W $'atom\nres_com\nres_cog\nmol_com\nmol_cog\nwhole_res_com\nwhole_res_cog\nwhole_mol_com\nwhole_mol_cog\npart_res_com\npart_res_cog\npart_mol_com\npart_mol_cog\ndyn_res_com\ndyn_res_cog\ndyn_mol_com\ndyn_mol_cog' -- $c));;
-seltype) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -W $'atom\nres_com\nres_cog\nmol_com\nmol_cog\nwhole_res_com\nwhole_res_cog\nwhole_mol_com\nwhole_mol_cog\npart_res_com\npart_res_cog\npart_mol_com\npart_mol_cog\ndyn_res_com\ndyn_res_cog\ndyn_mol_com\ndyn_mol_cog' -- $c));;
-o) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-mol) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_nmeig_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-xvg\n-f\n-s\n-of\n-ol\n-os\n-qc\n-v\n-nom\n-first\n-last\n-maxspec\n-T\n-P\n-sigma\n-scale\n-linear_toler\n-constr\n-width' -- $c)); return 0; fi
case "$p" in
-f) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.mtx?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-s) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.tpr?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-of) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-ol) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-os) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-qc) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-v) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.trr|.cpt|.tng)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_nmens_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-xvg\n-v\n-e\n-s\n-n\n-o\n-temp\n-seed\n-num\n-first\n-last' -- $c)); return 0; fi
case "$p" in
-v) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.trr|.cpt|.tng)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-e) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-s) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.tpr|.gro|.g96|.pdb|.brk|.ent)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-n) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.ndx?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-o) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.xtc|.trr|.gro|.g96|.pdb|.tng)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_nmr_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-b\n-e\n-w\n-xvg\n-f\n-f2\n-s\n-viol\n-pairs\n-ora\n-ort\n-oda\n-odr\n-odt\n-oten\n-dp\n-skip\n-aver\n-orinst\n-ovec' -- $c)); return 0; fi
case "$p" in
-f) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.edr?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-f2) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.edr?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-s) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.tpr?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-viol) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-pairs) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-ora) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-ort) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-oda) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-odr) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-odt) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-oten) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_nmtraj_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-s\n-v\n-o\n-eignr\n-phases\n-temp\n-amplitude\n-nframes' -- $c)); return 0; fi
case "$p" in
-s) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.tpr|.gro|.g96|.pdb|.brk|.ent)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-v) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.trr|.cpt|.tng)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-o) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.xtc|.trr|.gro|.g96|.pdb|.tng)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_nonbonded_benchmark_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-size\n-nt\n-simd\n-coulomb\n-table\n-combrule\n-halflj\n-energy\n-all\n-cutoff\n-iter\n-warmup\n-cycles\n-time\n-o' -- $c)); return 0; fi
case "$p" in
-o) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.csv?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_order_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-b\n-e\n-dt\n-w\n-xvg\n-f\n-n\n-nr\n-s\n-o\n-od\n-ob\n-os\n-Sg\n-Sk\n-Sgsl\n-Sksl\n-d\n-sl\n-szonly\n-permolecule\n-radial\n-calcdist' -- $c)); return 0; fi
case "$p" in
-f) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.xtc|.trr|.cpt|.gro|.g96|.pdb|.tng)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-n) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.ndx?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-nr) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.ndx?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-s) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.tpr?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-o) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-od) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-ob) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.pdb?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-os) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-Sg) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-Sk) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-Sgsl) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-Sksl) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_pairdist_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-f\n-s\n-b\n-e\n-dt\n-tu\n-fgroup\n-xvg\n-normpbc\n-nopbc\n-n\n-sf\n-selrpos\n-seltype\n-o\n-cutoff\n-type\n-refgrouping\n-selgrouping\n-ref\n-sel' -- $c)); return 0; fi
case "$p" in
-f) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.xtc|.trr|.cpt|.gro|.g96|.pdb|.tng)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-s) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.tpr|.gro|.g96|.pdb|.brk|.ent)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-n) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.ndx?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-selrpos) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -W $'atom\nres_com\nres_cog\nmol_com\nmol_cog\nwhole_res_com\nwhole_res_cog\nwhole_mol_com\nwhole_mol_cog\npart_res_com\npart_res_cog\npart_mol_com\npart_mol_cog\ndyn_res_com\ndyn_res_cog\ndyn_mol_com\ndyn_mol_cog' -- $c));;
-seltype) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -W $'atom\nres_com\nres_cog\nmol_com\nmol_cog\nwhole_res_com\nwhole_res_cog\nwhole_mol_com\nwhole_mol_cog\npart_res_com\npart_res_cog\npart_mol_com\npart_mol_cog\ndyn_res_com\ndyn_res_cog\ndyn_mol_com\ndyn_mol_cog' -- $c));;
-o) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_pdb2gmx_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-chainsep\n-merge\n-ff\n-water\n-inter\n-ss\n-ter\n-lys\n-arg\n-asp\n-glu\n-gln\n-his\n-angle\n-dist\n-una\n-ignh\n-missing\n-v\n-posrefc\n-vsite\n-heavyh\n-deuterate\n-nochargegrp\n-nocmap\n-renum\n-rtpres\n-f\n-o\n-p\n-i\n-n\n-q' -- $c)); return 0; fi
case "$p" in
-f) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.gro|.g96|.pdb|.brk|.ent|.esp|.tpr)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-o) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.gro|.g96|.pdb|.brk|.ent|.esp)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-p) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.top?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-i) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.itp?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-n) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.ndx?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-q) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.gro|.g96|.pdb|.brk|.ent|.esp)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_pme_error_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-s\n-o\n-so\n-beta\n-tune\n-self\n-seed\n-v' -- $c)); return 0; fi
case "$p" in
-s) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.tpr?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-o) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.out?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-so) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.tpr?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_polystat_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-b\n-e\n-dt\n-tu\n-w\n-xvg\n-s\n-f\n-n\n-o\n-v\n-p\n-i\n-nomw\n-pc' -- $c)); return 0; fi
case "$p" in
-s) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.tpr?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-f) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.xtc|.trr|.cpt|.gro|.g96|.pdb|.tng)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-n) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.ndx?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-o) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-v) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-p) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-i) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_potential_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-b\n-e\n-dt\n-w\n-xvg\n-f\n-n\n-s\n-o\n-oc\n-of\n-d\n-sl\n-cb\n-ce\n-tz\n-spherical\n-ng\n-center\n-symm\n-correct' -- $c)); return 0; fi
case "$p" in
-f) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.xtc|.trr|.cpt|.gro|.g96|.pdb|.tng)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-n) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.ndx?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-s) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.tpr?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-o) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-oc) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-of) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_principal_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-b\n-e\n-dt\n-tu\n-w\n-xvg\n-f\n-s\n-n\n-a1\n-a2\n-a3\n-om\n-foo' -- $c)); return 0; fi
case "$p" in
-f) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.xtc|.trr|.cpt|.gro|.g96|.pdb|.tng)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-s) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.tpr|.gro|.g96|.pdb|.brk|.ent)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-n) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.ndx?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-a1) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-a2) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-a3) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-om) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_rama_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-b\n-e\n-dt\n-w\n-xvg\n-f\n-s\n-o' -- $c)); return 0; fi
case "$p" in
-f) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.xtc|.trr|.cpt|.gro|.g96|.pdb|.tng)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-s) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.tpr?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-o) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_rdf_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-f\n-s\n-b\n-e\n-dt\n-tu\n-fgroup\n-xvg\n-normpbc\n-nopbc\n-n\n-sf\n-selrpos\n-seltype\n-o\n-cn\n-bin\n-norm\n-xy\n-excl\n-cut\n-rmax\n-surf\n-ref\n-sel' -- $c)); return 0; fi
case "$p" in
-f) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.xtc|.trr|.cpt|.gro|.g96|.pdb|.tng)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-s) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.tpr|.gro|.g96|.pdb|.brk|.ent)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-n) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.ndx?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-selrpos) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -W $'atom\nres_com\nres_cog\nmol_com\nmol_cog\nwhole_res_com\nwhole_res_cog\nwhole_mol_com\nwhole_mol_cog\npart_res_com\npart_res_cog\npart_mol_com\npart_mol_cog\ndyn_res_com\ndyn_res_cog\ndyn_mol_com\ndyn_mol_cog' -- $c));;
-seltype) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -W $'atom\nres_com\nres_cog\nmol_com\nmol_cog\nwhole_res_com\nwhole_res_cog\nwhole_mol_com\nwhole_mol_cog\npart_res_com\npart_res_cog\npart_mol_com\npart_mol_cog\ndyn_res_com\ndyn_res_cog\ndyn_mol_com\ndyn_mol_cog' -- $c));;
-o) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-cn) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_report_methods_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-s\n-m\n-o' -- $c)); return 0; fi
case "$p" in
-s) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.tpr|.gro|.g96|.pdb|.brk|.ent)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-m) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.tex?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-o) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.out?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_rms_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-b\n-e\n-dt\n-tu\n-w\n-xvg\n-s\n-f\n-f2\n-n\n-o\n-mir\n-a\n-dist\n-m\n-bin\n-bm\n-what\n-nopbc\n-fit\n-prev\n-split\n-skip\n-skip2\n-max\n-min\n-bmax\n-bmin\n-nomw\n-nlevels\n-ng' -- $c)); return 0; fi
case "$p" in
-s) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.tpr|.gro|.g96|.pdb|.brk|.ent)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-f) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.xtc|.trr|.cpt|.gro|.g96|.pdb|.tng)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-f2) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.xtc|.trr|.cpt|.gro|.g96|.pdb|.tng)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-n) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.ndx?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-o) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-mir) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-a) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-dist) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-m) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xpm?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-bin) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.dat?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-bm) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xpm?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_rmsdist_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-b\n-e\n-dt\n-w\n-xvg\n-f\n-s\n-n\n-equiv\n-o\n-rms\n-scl\n-mean\n-nmr3\n-nmr6\n-noe\n-nlevels\n-max\n-nosumh\n-nopbc' -- $c)); return 0; fi
case "$p" in
-f) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.xtc|.trr|.cpt|.gro|.g96|.pdb|.tng)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-s) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.tpr|.gro|.g96|.pdb|.brk|.ent)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-n) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.ndx?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-equiv) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.dat?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-o) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-rms) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xpm?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-scl) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xpm?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-mean) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xpm?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-nmr3) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xpm?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-nmr6) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xpm?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-noe) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.dat?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_rmsf_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-b\n-e\n-dt\n-w\n-xvg\n-f\n-s\n-n\n-q\n-oq\n-ox\n-o\n-od\n-oc\n-dir\n-res\n-aniso\n-nofit' -- $c)); return 0; fi
case "$p" in
-f) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.xtc|.trr|.cpt|.gro|.g96|.pdb|.tng)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-s) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.tpr|.gro|.g96|.pdb|.brk|.ent)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-n) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.ndx?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-q) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.pdb?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-oq) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.pdb?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-ox) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.pdb?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-o) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-od) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-oc) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-dir) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.log?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_rotacf_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-b\n-e\n-dt\n-w\n-xvg\n-f\n-s\n-n\n-o\n-d\n-noaver\n-acflen\n-nonormalize\n-P\n-fitfn\n-beginfit\n-endfit' -- $c)); return 0; fi
case "$p" in
-f) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.xtc|.trr|.cpt|.gro|.g96|.pdb|.tng)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-s) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.tpr?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-n) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.ndx?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-o) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_rotmat_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-b\n-e\n-dt\n-w\n-xvg\n-f\n-s\n-n\n-o\n-ref\n-skip\n-fitxy\n-nomw' -- $c)); return 0; fi
case "$p" in
-f) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.xtc|.trr|.cpt|.gro|.g96|.pdb|.tng)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-s) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.tpr|.gro|.g96|.pdb|.brk|.ent)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-n) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.ndx?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-o) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_saltbr_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-b\n-e\n-dt\n-f\n-s\n-t\n-sep' -- $c)); return 0; fi
case "$p" in
-f) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.xtc|.trr|.cpt|.gro|.g96|.pdb|.tng)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-s) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.tpr?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_sans_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-b\n-e\n-dt\n-tu\n-xvg\n-s\n-f\n-n\n-d\n-pr\n-sq\n-prframe\n-sqframe\n-bin\n-mode\n-mcover\n-method\n-nopbc\n-grid\n-startq\n-endq\n-qstep\n-seed' -- $c)); return 0; fi
case "$p" in
-s) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.tpr?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-f) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.xtc|.trr|.cpt|.gro|.g96|.pdb|.tng)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-n) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.ndx?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-d) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.dat?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-pr) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-sq) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-prframe) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-sqframe) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_sasa_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-f\n-s\n-b\n-e\n-dt\n-tu\n-fgroup\n-xvg\n-normpbc\n-nopbc\n-n\n-sf\n-selrpos\n-o\n-odg\n-or\n-oa\n-tv\n-q\n-probe\n-ndots\n-noprot\n-dgs\n-surface\n-output' -- $c)); return 0; fi
case "$p" in
-f) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.xtc|.trr|.cpt|.gro|.g96|.pdb|.tng)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-s) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.tpr|.gro|.g96|.pdb|.brk|.ent)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-n) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.ndx?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-selrpos) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -W $'atom\nres_com\nres_cog\nmol_com\nmol_cog\nwhole_res_com\nwhole_res_cog\nwhole_mol_com\nwhole_mol_cog\npart_res_com\npart_res_cog\npart_mol_com\npart_mol_cog\ndyn_res_com\ndyn_res_cog\ndyn_mol_com\ndyn_mol_cog' -- $c));;
-o) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-odg) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-or) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-oa) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-tv) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-q) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.pdb?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_saxs_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-b\n-e\n-dt\n-xvg\n-f\n-s\n-n\n-d\n-sq\n-ng\n-startq\n-endq\n-energy' -- $c)); return 0; fi
case "$p" in
-f) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.xtc|.trr|.cpt|.gro|.g96|.pdb|.tng)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-s) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.tpr|.gro|.g96|.pdb|.brk|.ent)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-n) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.ndx?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-d) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.dat?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-sq) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_select_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-f\n-s\n-b\n-e\n-dt\n-tu\n-fgroup\n-xvg\n-normpbc\n-nopbc\n-n\n-sf\n-selrpos\n-seltype\n-os\n-oc\n-oi\n-on\n-om\n-of\n-ofpdb\n-olt\n-select\n-norm\n-cfnorm\n-resnr\n-pdbatoms\n-nocumlt' -- $c)); return 0; fi
case "$p" in
-f) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.xtc|.trr|.cpt|.gro|.g96|.pdb|.tng)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-s) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.tpr|.gro|.g96|.pdb|.brk|.ent)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-n) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.ndx?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-selrpos) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -W $'atom\nres_com\nres_cog\nmol_com\nmol_cog\nwhole_res_com\nwhole_res_cog\nwhole_mol_com\nwhole_mol_cog\npart_res_com\npart_res_cog\npart_mol_com\npart_mol_cog\ndyn_res_com\ndyn_res_cog\ndyn_mol_com\ndyn_mol_cog' -- $c));;
-seltype) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -W $'atom\nres_com\nres_cog\nmol_com\nmol_cog\nwhole_res_com\nwhole_res_cog\nwhole_mol_com\nwhole_mol_cog\npart_res_com\npart_res_cog\npart_mol_com\npart_mol_cog\ndyn_res_com\ndyn_res_cog\ndyn_mol_com\ndyn_mol_cog' -- $c));;
-os) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-oc) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-oi) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.dat?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-on) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.ndx?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-om) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-of) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-ofpdb) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.pdb?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-olt) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_sham_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-w\n-xvg\n-f\n-ge\n-ene\n-dist\n-histo\n-bin\n-lp\n-ls\n-lsh\n-lss\n-ls3\n-g\n-notime\n-b\n-e\n-ttol\n-n\n-d\n-nosham\n-tsham\n-pmin\n-dim\n-ngrid\n-xmin\n-xmax\n-pmax\n-gmax\n-emin\n-emax\n-nlevels' -- $c)); return 0; fi
case "$p" in
-f) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-ge) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-ene) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-dist) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-histo) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-bin) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.ndx?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-lp) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xpm?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-ls) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xpm?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-lsh) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xpm?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-lss) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xpm?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-ls3) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.pdb?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-g) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.log?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_sigeps_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-w\n-xvg\n-o\n-c6\n-cn\n-pow\n-sig\n-eps\n-A\n-B\n-C\n-qi\n-qj\n-sigfac' -- $c)); return 0; fi
case "$p" in
-o) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_solvate_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-cp\n-cs\n-o\n-p\n-box\n-radius\n-scale\n-shell\n-maxsol\n-vel' -- $c)); return 0; fi
case "$p" in
-cp) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.gro|.g96|.pdb|.brk|.ent|.esp|.tpr)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-cs) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.gro|.g96|.pdb|.brk|.ent|.esp|.tpr)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-o) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.gro|.g96|.pdb|.brk|.ent|.esp)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-p) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.top?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_sorient_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-b\n-e\n-dt\n-w\n-xvg\n-f\n-s\n-n\n-o\n-no\n-ro\n-co\n-rc\n-com\n-v23\n-rmin\n-rmax\n-cbin\n-rbin\n-pbc' -- $c)); return 0; fi
case "$p" in
-f) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.xtc|.trr|.cpt|.gro|.g96|.pdb|.tng)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-s) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.tpr|.gro|.g96|.pdb|.brk|.ent)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-n) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.ndx?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-o) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-no) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-ro) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-co) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-rc) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_spatial_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-b\n-e\n-dt\n-w\n-s\n-f\n-n\n-pbc\n-nodiv\n-ign\n-bin\n-nab' -- $c)); return 0; fi
case "$p" in
-s) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.tpr|.gro|.g96|.pdb|.brk|.ent)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-f) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.xtc|.trr|.cpt|.gro|.g96|.pdb|.tng)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-n) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.ndx?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_spol_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-b\n-e\n-dt\n-w\n-xvg\n-f\n-s\n-n\n-o\n-com\n-refat\n-rmin\n-rmax\n-dip\n-bw' -- $c)); return 0; fi
case "$p" in
-f) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.xtc|.trr|.cpt|.gro|.g96|.pdb|.tng)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-s) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.tpr?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-n) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.ndx?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-o) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_tcaf_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-b\n-e\n-dt\n-w\n-xvg\n-f\n-s\n-n\n-ot\n-oa\n-o\n-of\n-oc\n-ov\n-mol\n-k34\n-wt\n-acflen\n-nonormalize\n-P\n-fitfn\n-beginfit\n-endfit' -- $c)); return 0; fi
case "$p" in
-f) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.trr|.cpt|.tng)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-s) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.tpr|.gro|.g96|.pdb|.brk|.ent)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-n) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.ndx?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-ot) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-oa) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-o) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-of) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-oc) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-ov) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_traj_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-b\n-e\n-dt\n-tu\n-w\n-xvg\n-f\n-s\n-n\n-ox\n-oxt\n-ov\n-of\n-ob\n-ot\n-ekt\n-ekr\n-vd\n-cv\n-cf\n-av\n-af\n-com\n-nopbc\n-mol\n-nojump\n-nox\n-noy\n-noz\n-ng\n-len\n-fp\n-bin\n-ctime\n-scale' -- $c)); return 0; fi
case "$p" in
-f) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.xtc|.trr|.cpt|.gro|.g96|.pdb|.tng)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-s) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.tpr|.gro|.g96|.pdb|.brk|.ent)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-n) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.ndx?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-ox) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-oxt) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.xtc|.trr|.cpt|.gro|.g96|.pdb|.tng)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-ov) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-of) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-ob) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-ot) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-ekt) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-ekr) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-vd) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-cv) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.pdb?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-cf) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.pdb?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-av) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-af) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_trajectory_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-f\n-s\n-b\n-e\n-dt\n-tu\n-fgroup\n-xvg\n-normpbc\n-nopbc\n-n\n-sf\n-selrpos\n-seltype\n-ox\n-ov\n-of\n-select\n-nox\n-noy\n-noz\n-len' -- $c)); return 0; fi
case "$p" in
-f) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.xtc|.trr|.cpt|.gro|.g96|.pdb|.tng)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-s) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.tpr|.gro|.g96|.pdb|.brk|.ent)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-n) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.ndx?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-selrpos) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -W $'atom\nres_com\nres_cog\nmol_com\nmol_cog\nwhole_res_com\nwhole_res_cog\nwhole_mol_com\nwhole_mol_cog\npart_res_com\npart_res_cog\npart_mol_com\npart_mol_cog\ndyn_res_com\ndyn_res_cog\ndyn_mol_com\ndyn_mol_cog' -- $c));;
-seltype) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -W $'atom\nres_com\nres_cog\nmol_com\nmol_cog\nwhole_res_com\nwhole_res_cog\nwhole_mol_com\nwhole_mol_cog\npart_res_com\npart_res_cog\npart_mol_com\npart_mol_cog\ndyn_res_com\ndyn_res_cog\ndyn_mol_com\ndyn_mol_cog' -- $c));;
-ox) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-ov) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-of) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_trjcat_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-tu\n-xvg\n-f\n-o\n-n\n-demux\n-b\n-e\n-dt\n-settime\n-nosort\n-keeplast\n-overwrite\n-cat' -- $c)); return 0; fi
case "$p" in
-f) COMPREPLY=( $(compgen -S ' ' -X '!*@(.xtc|.trr|.cpt|.gro|.g96|.pdb|.tng)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-o) COMPREPLY=( $(compgen -S ' ' -X '!*@(.xtc|.trr|.gro|.g96|.pdb|.tng)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-n) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.ndx?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-demux) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_trjconv_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-b\n-e\n-tu\n-w\n-xvg\n-f\n-o\n-s\n-n\n-fr\n-sub\n-drop\n-skip\n-dt\n-round\n-dump\n-t0\n-timestep\n-pbc\n-ur\n-center\n-boxcenter\n-box\n-trans\n-shift\n-fit\n-ndec\n-novel\n-force\n-trunc\n-exec\n-split\n-sep\n-nzero\n-dropunder\n-dropover\n-conect' -- $c)); return 0; fi
case "$p" in
-f) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.xtc|.trr|.cpt|.gro|.g96|.pdb|.tng)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-o) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.xtc|.trr|.gro|.g96|.pdb|.tng)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-s) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.tpr|.gro|.g96|.pdb|.brk|.ent)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-n) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.ndx?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-fr) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.ndx?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-sub) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.ndx?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-drop) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_trjorder_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-b\n-e\n-dt\n-xvg\n-f\n-s\n-n\n-o\n-nshell\n-na\n-da\n-com\n-r\n-z' -- $c)); return 0; fi
case "$p" in
-f) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.xtc|.trr|.cpt|.gro|.g96|.pdb|.tng)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-s) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.tpr|.gro|.g96|.pdb|.brk|.ent)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-n) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.ndx?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-o) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.xtc|.trr|.gro|.g96|.pdb|.tng)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-nshell) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_tune_pme_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-xvg\n-p\n-err\n-so\n-s\n-o\n-x\n-cpi\n-cpo\n-c\n-e\n-g\n-dhdl\n-field\n-table\n-tablep\n-tableb\n-rerun\n-tpi\n-tpid\n-ei\n-eo\n-px\n-pf\n-ro\n-ra\n-rs\n-rt\n-mtx\n-swap\n-bo\n-bx\n-bcpo\n-bc\n-be\n-bg\n-beo\n-bdhdl\n-bfield\n-btpi\n-btpid\n-bdevout\n-brunav\n-bpx\n-bpf\n-bro\n-bra\n-brs\n-brt\n-bmtx\n-bdn\n-bswap\n-mdrun\n-np\n-npstring\n-ntmpi\n-r\n-max\n-min\n-npme\n-fix\n-rmax\n-rmin\n-noscalevdw\n-ntpr\n-steps\n-resetstep\n-nsteps\n-launch\n-nobench\n-nocheck\n-gpu_id\n-noappend\n-cpnum\n-deffnm' -- $c)); return 0; fi
case "$p" in
-p) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.out?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-err) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.log?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-so) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.tpr?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-s) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.tpr?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-o) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.trr|.cpt|.tng)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-x) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.xtc|.tng)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-cpi) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.cpt?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-cpo) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.cpt?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-c) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.gro|.g96|.pdb|.brk|.ent|.esp)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-e) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.edr?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-g) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.log?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-dhdl) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-field) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-table) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-tablep) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-tableb) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-rerun) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.xtc|.trr|.cpt|.gro|.g96|.pdb|.tng)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-tpi) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-tpid) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-ei) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.edi?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-eo) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-px) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-pf) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-ro) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-ra) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.log?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-rs) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.log?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-rt) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.log?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-mtx) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.mtx?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-swap) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-bo) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.trr|.cpt|.tng)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-bx) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xtc?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-bcpo) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.cpt?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-bc) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.gro|.g96|.pdb|.brk|.ent|.esp)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-be) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.edr?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-bg) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.log?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-beo) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-bdhdl) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-bfield) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-btpi) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-btpid) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-bdevout) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-brunav) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-bpx) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-bpf) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-bro) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-bra) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.log?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-brs) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.log?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-brt) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.log?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-bmtx) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.mtx?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-bdn) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.ndx?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-bswap) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_vanhove_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-b\n-e\n-dt\n-w\n-xvg\n-f\n-s\n-n\n-om\n-or\n-ot\n-sqrt\n-fm\n-rmax\n-rbin\n-mmax\n-nlevels\n-nr\n-fr\n-rt\n-ft' -- $c)); return 0; fi
case "$p" in
-f) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.xtc|.trr|.cpt|.gro|.g96|.pdb|.tng)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-s) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.tpr|.gro|.g96|.pdb|.brk|.ent)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-n) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.ndx?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-om) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xpm?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-or) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-ot) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_velacc_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-b\n-e\n-dt\n-w\n-xvg\n-f\n-s\n-n\n-o\n-os\n-m\n-norecip\n-mol\n-acflen\n-nonormalize\n-P\n-fitfn\n-beginfit\n-endfit' -- $c)); return 0; fi
case "$p" in
-f) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.trr|.cpt|.tng)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-s) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.tpr|.gro|.g96|.pdb|.brk|.ent)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-n) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.ndx?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-o) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-os) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_view_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-b\n-e\n-dt\n-f\n-s\n-n' -- $c)); return 0; fi
case "$p" in
-f) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.xtc|.trr|.cpt|.gro|.g96|.pdb|.tng)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-s) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.tpr?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-n) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.ndx?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_wham_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-xvg\n-ix\n-if\n-it\n-is\n-o\n-hist\n-oiact\n-iiact\n-bsres\n-bsprof\n-tab\n-min\n-max\n-noauto\n-bins\n-temp\n-tol\n-v\n-b\n-e\n-dt\n-histonly\n-boundsonly\n-nolog\n-unit\n-zprof0\n-cycl\n-sym\n-ac\n-acsig\n-ac-trestart\n-nBootstrap\n-bs-method\n-bs-tau\n-bs-seed\n-histbs-block\n-vbs' -- $c)); return 0; fi
case "$p" in
-ix) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.dat?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-if) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.dat?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-it) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.dat?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-is) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.dat?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-o) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-hist) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-oiact) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-iiact) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.dat?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-bsres) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-bsprof) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xvg?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-tab) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.dat?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_wheel_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-f\n-o\n-r0\n-rot0\n-T\n-nonn' -- $c)); return 0; fi
case "$p" in
-f) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.dat?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-o) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.eps?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_x2top_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-f\n-o\n-r\n-ff\n-v\n-nexcl\n-noH14\n-alldih\n-remdih\n-nopairs\n-name\n-nopbc\n-pdbq\n-noparam\n-noround\n-kb\n-kt\n-kp' -- $c)); return 0; fi
case "$p" in
-f) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*@(.gro|.g96|.pdb|.brk|.ent|.esp|.tpr)?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-o) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.top?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-r) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.rtp?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_xpm2ps_compl() {
local IFS=$'\n'
local c=${COMP_WORDS[COMP_CWORD]}
local n
for ((n=1;n<COMP_CWORD;++n)) ; do [[ "${COMP_WORDS[COMP_CWORD-n]}" == -* ]] && break ; done
local p=${COMP_WORDS[COMP_CWORD-n]}
COMPREPLY=()
if (( $COMP_CWORD <= 1 )) || [[ $c == -* ]]; then COMPREPLY=( $(compgen -S ' '  -W $'-w\n-f\n-f2\n-di\n-do\n-o\n-xpm\n-noframe\n-title\n-yonce\n-legend\n-diag\n-size\n-bx\n-by\n-rainbow\n-gradient\n-skip\n-zeroline\n-legoffset\n-combine\n-cmin\n-cmax' -- $c)); return 0; fi
case "$p" in
-f) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xpm?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-f2) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xpm?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-di) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.m2p?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-do) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.m2p?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-o) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.eps?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
-xpm) (( $n <= 1 )) && COMPREPLY=( $(compgen -S ' ' -X '!*.xpm?(.gz|.Z)' -f -- $c ; compgen -S '/' -d $c));;
esac }
_gmx_compl() {
local i c m
local IFS=$'\n'
COMPREPLY=()
unset COMP_WORDS[0]
for ((i=1;i<COMP_CWORD;++i)) ; do
[[ "${COMP_WORDS[i]}" != -* ]] && break
unset COMP_WORDS[i]
done
if (( i == COMP_CWORD )); then
c=${COMP_WORDS[COMP_CWORD]}
COMPREPLY=( $(compgen -S ' ' -W $'-h\n-quiet\n-version\n-copyright\n-nice\n-nobackup\nanaeig\nanalyze\nangle\nawh\nbar\nbundle\ncheck\nchi\ncluster\nclustsize\nconfrms\nconvert-tpr\nconvert-trj\ncovar\ncurrent\ndensity\ndensmap\ndensorder\ndielectric\ndipoles\ndisre\ndistance\ndo_dssp\ndos\ndump\ndyecoupl\neditconf\neneconv\nenemat\nenergy\nextract-cluster\nfilter\nfreevolume\ngangle\ngenconf\ngenion\ngenrestr\ngrompp\ngyrate\nh2order\nhbond\nhelix\nhelixorient\nhelp\nhydorder\ninsert-molecules\nlie\nmake_edi\nmake_ndx\nmdmat\nmdrun\nmindist\nmk_angndx\nmsd\nnmeig\nnmens\nnmr\nnmtraj\nnonbonded-benchmark\norder\npairdist\npdb2gmx\npme_error\npolystat\npotential\nprincipal\nrama\nrdf\nreport-methods\nrms\nrmsdist\nrmsf\nrotacf\nrotmat\nsaltbr\nsans\nsasa\nsaxs\nselect\nsham\nsigeps\nsolvate\nsorient\nspatial\nspol\ntcaf\ntraj\ntrajectory\ntrjcat\ntrjconv\ntrjorder\ntune_pme\nvanhove\nvelacc\nview\nwham\nwheel\nx2top\nxpm2ps' -- $c) )
return 0
fi
m=${COMP_WORDS[i]}
COMP_WORDS=( "${COMP_WORDS[@]}" )
COMP_CWORD=$((COMP_CWORD-i))
case "$m" in
anaeig) _gmx_anaeig_compl ;;
analyze) _gmx_analyze_compl ;;
angle) _gmx_angle_compl ;;
awh) _gmx_awh_compl ;;
bar) _gmx_bar_compl ;;
bundle) _gmx_bundle_compl ;;
check) _gmx_check_compl ;;
chi) _gmx_chi_compl ;;
cluster) _gmx_cluster_compl ;;
clustsize) _gmx_clustsize_compl ;;
confrms) _gmx_confrms_compl ;;
convert-tpr) _gmx_convert_tpr_compl ;;
convert-trj) _gmx_convert_trj_compl ;;
covar) _gmx_covar_compl ;;
current) _gmx_current_compl ;;
density) _gmx_density_compl ;;
densmap) _gmx_densmap_compl ;;
densorder) _gmx_densorder_compl ;;
dielectric) _gmx_dielectric_compl ;;
dipoles) _gmx_dipoles_compl ;;
disre) _gmx_disre_compl ;;
distance) _gmx_distance_compl ;;
do_dssp) _gmx_do_dssp_compl ;;
dos) _gmx_dos_compl ;;
dump) _gmx_dump_compl ;;
dyecoupl) _gmx_dyecoupl_compl ;;
editconf) _gmx_editconf_compl ;;
eneconv) _gmx_eneconv_compl ;;
enemat) _gmx_enemat_compl ;;
energy) _gmx_energy_compl ;;
extract-cluster) _gmx_extract_cluster_compl ;;
filter) _gmx_filter_compl ;;
freevolume) _gmx_freevolume_compl ;;
gangle) _gmx_gangle_compl ;;
genconf) _gmx_genconf_compl ;;
genion) _gmx_genion_compl ;;
genrestr) _gmx_genrestr_compl ;;
grompp) _gmx_grompp_compl ;;
gyrate) _gmx_gyrate_compl ;;
h2order) _gmx_h2order_compl ;;
hbond) _gmx_hbond_compl ;;
helix) _gmx_helix_compl ;;
helixorient) _gmx_helixorient_compl ;;
help) _gmx_help_compl ;;
hydorder) _gmx_hydorder_compl ;;
insert-molecules) _gmx_insert_molecules_compl ;;
lie) _gmx_lie_compl ;;
make_edi) _gmx_make_edi_compl ;;
make_ndx) _gmx_make_ndx_compl ;;
mdmat) _gmx_mdmat_compl ;;
mdrun) _gmx_mdrun_compl ;;
mindist) _gmx_mindist_compl ;;
mk_angndx) _gmx_mk_angndx_compl ;;
msd) _gmx_msd_compl ;;
nmeig) _gmx_nmeig_compl ;;
nmens) _gmx_nmens_compl ;;
nmr) _gmx_nmr_compl ;;
nmtraj) _gmx_nmtraj_compl ;;
nonbonded-benchmark) _gmx_nonbonded_benchmark_compl ;;
order) _gmx_order_compl ;;
pairdist) _gmx_pairdist_compl ;;
pdb2gmx) _gmx_pdb2gmx_compl ;;
pme_error) _gmx_pme_error_compl ;;
polystat) _gmx_polystat_compl ;;
potential) _gmx_potential_compl ;;
principal) _gmx_principal_compl ;;
rama) _gmx_rama_compl ;;
rdf) _gmx_rdf_compl ;;
report-methods) _gmx_report_methods_compl ;;
rms) _gmx_rms_compl ;;
rmsdist) _gmx_rmsdist_compl ;;
rmsf) _gmx_rmsf_compl ;;
rotacf) _gmx_rotacf_compl ;;
rotmat) _gmx_rotmat_compl ;;
saltbr) _gmx_saltbr_compl ;;
sans) _gmx_sans_compl ;;
sasa) _gmx_sasa_compl ;;
saxs) _gmx_saxs_compl ;;
select) _gmx_select_compl ;;
sham) _gmx_sham_compl ;;
sigeps) _gmx_sigeps_compl ;;
solvate) _gmx_solvate_compl ;;
sorient) _gmx_sorient_compl ;;
spatial) _gmx_spatial_compl ;;
spol) _gmx_spol_compl ;;
tcaf) _gmx_tcaf_compl ;;
traj) _gmx_traj_compl ;;
trajectory) _gmx_trajectory_compl ;;
trjcat) _gmx_trjcat_compl ;;
trjconv) _gmx_trjconv_compl ;;
trjorder) _gmx_trjorder_compl ;;
tune_pme) _gmx_tune_pme_compl ;;
vanhove) _gmx_vanhove_compl ;;
velacc) _gmx_velacc_compl ;;
view) _gmx_view_compl ;;
wham) _gmx_wham_compl ;;
wheel) _gmx_wheel_compl ;;
x2top) _gmx_x2top_compl ;;
xpm2ps) _gmx_xpm2ps_compl ;;
esac }
