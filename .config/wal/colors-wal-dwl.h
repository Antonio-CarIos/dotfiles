/* Taken from https://github.com/djpohly/dwl/issues/466 */
#define COLOR(hex)    { ((hex >> 24) & 0xFF) / 255.0f, \
                        ((hex >> 16) & 0xFF) / 255.0f, \
                        ((hex >> 8) & 0xFF) / 255.0f, \
                        (hex & 0xFF) / 255.0f }

static const float rootcolor[]             = COLOR(0x22190eff);
static uint32_t colors[][3]                = {
	/*               fg          bg          border    */
	[SchemeNorm] = { 0xc7c5c2ff, 0x22190eff, 0x72695eff },
	[SchemeSel]  = { 0xc7c5c2ff, 0x55B5A9ff, 0x60708Aff },
	[SchemeUrg]  = { 0xc7c5c2ff, 0x60708Aff, 0x55B5A9ff },
};
