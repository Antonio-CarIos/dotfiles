const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#22190e", /* black   */
  [1] = "#60708A", /* red     */
  [2] = "#55B5A9", /* green   */
  [3] = "#A4A69F", /* yellow  */
  [4] = "#C9B6AD", /* blue    */
  [5] = "#D9CCB5", /* magenta */
  [6] = "#DED7CA", /* cyan    */
  [7] = "#c7c5c2", /* white   */

  /* 8 bright colors */
  [8]  = "#72695e",  /* black   */
  [9]  = "#60708A",  /* red     */
  [10] = "#55B5A9", /* green   */
  [11] = "#A4A69F", /* yellow  */
  [12] = "#C9B6AD", /* blue    */
  [13] = "#D9CCB5", /* magenta */
  [14] = "#DED7CA", /* cyan    */
  [15] = "#c7c5c2", /* white   */

  /* special colors */
  [256] = "#22190e", /* background */
  [257] = "#c7c5c2", /* foreground */
  [258] = "#c7c5c2",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
