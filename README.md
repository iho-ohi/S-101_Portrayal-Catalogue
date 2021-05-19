# S-101 Portrayal-Catalogue
IHO S-101 Portrayal Catalogue development, discussion, and review

## Changelog
### 1.1.4 - use with FC 1.0.0 of 2019-04-09
*	Removed mariners viewing groups and viewing group layers
*	Correctly handle missing attribute values for attributes with an upper multiplicity of one
*	Draw Foul Ground point symbols under RADAR when Radar Overlay context parameter is false
*	Rework TextInstruction commands by removing viewing group and drawing priority parameters
*	Use same symbolization for RestrictedAreaRegulatory as for RestrictedAreaNavigational
*	Don't treat prominent features as visually conspicuous
*	Assign the viewing group for wrecks based on results of UDWHAZ05
*	Use multiple viewing groups to implement symbol / text dependencies, see [Change Proposal Form](https://github.com/IHO-S100WG/TSM8/blob/master/6.X-1%20Multiple%20viewing%20groups%20per%20drawing%20instruction/Allow%20multiple%20viewing%20groups%20per%20drawing%20instruction.pdf)
*	Don't show VALSOU on curve obstruction hazard symbol
*	Display feature name for Bridge features in viewing group 26 instead of 21
*	Update context parameter defaults per IEC 61174 ed4 Table 3
	* Full light lines: off
	* Shallow water dangers: on
	* Plain/symbolized boundaries: plain
	* Radar overlay: off

### 1.1.3 - use with FC 1.0.0 of 2019-04-09
*	Draw 360 degree arc around LightAllAround when appropriate
*	Assign shallow water pattern to proper viewing group
*	Handle blue and yellow lights properly
*	Viewing group layers implementing S-52 text group layers are no longer included in a display mode
*	Portray FoulGround feature in accordance with S-52 rules for OBSTRN where CATOBS = 7
*	Fixed handling of restricted areas with no listed restrictions
*	Reset rotation after drawing rotated symbol

### 1.1.2 - use with FC 1.0.0 of 2019-04-09
*	Remove catalog entry for deleted file svgStyle.css
