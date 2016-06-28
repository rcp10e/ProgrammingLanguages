/*
 * Switch to stack of the new process and set up
 * his segmentation registers.
 */
retu (rp->p_addr);
sureg ();
/*
 * If the new process paused because it was
 * swapped out, set the stack level to the last call
 * to savu(u_ssav).  This means that the return
 * which is executed immediately after the call to aretu
 * actually returns from the last routine which did
 * the savu.
 *
 * You are not expected to understand this.
 */
if (rp->p_flag & SSWAP)
  {
    rp->p_flag = &~SSWAP;
    aretu (u.u_ssav);
  }
/*
 * The value returned here has many subtle implications.
 * See the newproc comments.
 */
return (1);
