/*****************************************************************************
**  ATRIUM ELEVATOR FIX
**
**  If a survivor skips past the elevator, the other survivors will not be
**  able to activate the elevator, as it requires all living survivors to be
**  inside it, preventing the other survivors from using the elevator.
**
**  This fix checks the positions of all survivors when the elevator button
**  is pressed (only while locked) to see if they are either inside the
**  elevator, or have skipped past the elevator, and allows it to be used if
**  all checks are passed.
**
**  If all survivors are inside the elevator as normal, this script will not
**  be run, the standard logic will be used to activate the elevator.
*****************************************************************************/

printl( "Logic modified for elevator softlock fix" );

// Define starting area.
local c1m4_areaStart_vecMin = Vector( -3200, -5336, 520 );
local c1m4_areaStart_vecMax = Vector( -1844, -4508, 744 );

// Define area before the bridge.
local c1m4_areaPreBridge_vecMin = Vector( -3312, -4508, 520 );
local c1m4_areaPreBridge_vecMax = Vector( -2952, -4224, 744 );

// Define area across the bridge.
local c1m4_areaBridge_vecMin = Vector( -3564, -4224, 520 );
local c1m4_areaBridge_vecMax = Vector( -3200, -3568, 812 );

// Define area before the elevator.
local c1m4_areaPreElevator_vecMin = Vector( -3920, -3568, 520 );
local c1m4_areaPreElevator_vecMax = Vector( -3324, -3240, 744 );

// Define closet area before the elevator.
local c1m4_areaCloset_vecMin = Vector( -3452, -3240, 520 );
local c1m4_areaCloset_vecMax = Vector( -3324, -3048, 744 );

// Injected I/O. If button_inelevator is pressed while locked, check survivor positions to see if any survivors have skipped the elevator, and if remaining survivors are in the elevator.
EntFire( "button_elev_3rdfloor", "AddOutput", "OnUseLocked worldspawn:RunScriptCode:c1m4_CheckSurvivors():0:-1" );

// Loop through all survivors to check if their positions are within the defined areas.
// End the loop if we find a valid survivor that is outside these areas.
function c1m4_CheckSurvivors()
{
	if ( developer() > 0 ) { printl( "Ran c1m4_CheckSurvivors" ); }

	local checkPassed = true;

	// Loop through all living survivors.
	for ( local hndSurvivor; ( hndSurvivor = Entities.FindByClassname( hndSurvivor, "player" ) ) != null; )
	{
		// Emulate standard behaviour by ignoring dead, incapped, and hanging survivors.
		if ( hndSurvivor.IsSurvivor() && ! hndSurvivor.IsDead() && ! hndSurvivor.IsDying() )
		{
			// Validate position of this survivor.
			checkPassed = c1m4_ValidatePosition( hndSurvivor.GetOrigin() );

			// A survivor failed the check, end the function early and do not activate the elevator.
			if ( checkPassed == false ) { return false; }
		}
	}

	// Successfully validated all survivors, so activate the elevator.
	if ( developer() > 0 ) { printl( "All survivors have passed validation, activating elevator" ); }

	// Remove the elevator button denial director hint to avoid confusion.
	EntFire( "event_elevator_deny", "Kill" );

	// Simulate button press on button_inelevator to run its OnPressed events.
	// Button has to be unlocked for the Press input to work.
	EntFire( "button_elev_3rdfloor", "Unlock" );
	EntFire( "button_elev_3rdfloor", "Press" );
}

// Check if the passed survivor position is between the min and max vectors of the defined areas.
// Returns true if survivor is within the defined areas.
// Returns false if survivor is outside the defined areas.
function c1m4_ValidatePosition( vecSurvivor )
{
	if ( developer() > 0 ) { printl( "Validating position: " + vecSurvivor ); }

	if ( ( vecSurvivor.x > c1m4_areaStart_vecMin.x && vecSurvivor.x < c1m4_areaStart_vecMax.x &&
		 vecSurvivor.y > c1m4_areaStart_vecMin.y && vecSurvivor.y < c1m4_areaStart_vecMax.y &&
		 vecSurvivor.z > c1m4_areaStart_vecMin.z && vecSurvivor.z < c1m4_areaStart_vecMax.z )
		 ||
		 ( vecSurvivor.x > c1m4_areaPreBridge_vecMin.x && vecSurvivor.x < c1m4_areaPreBridge_vecMax.x &&
		 vecSurvivor.y > c1m4_areaPreBridge_vecMin.y && vecSurvivor.y < c1m4_areaPreBridge_vecMax.y &&
		 vecSurvivor.z > c1m4_areaPreBridge_vecMin.z && vecSurvivor.z < c1m4_areaPreBridge_vecMax.z )
		 ||
		 ( vecSurvivor.x > c1m4_areaBridge_vecMin.x && vecSurvivor.x < c1m4_areaBridge_vecMax.x &&
		 vecSurvivor.y > c1m4_areaBridge_vecMin.y && vecSurvivor.y < c1m4_areaBridge_vecMax.y &&
		 vecSurvivor.z > c1m4_areaBridge_vecMin.z && vecSurvivor.z < c1m4_areaBridge_vecMax.z )
		 ||
		 ( vecSurvivor.x > c1m4_areaPreElevator_vecMin.x && vecSurvivor.x < c1m4_areaPreElevator_vecMax.x &&
		 vecSurvivor.y > c1m4_areaPreElevator_vecMin.y && vecSurvivor.y < c1m4_areaPreElevator_vecMax.y &&
		 vecSurvivor.z > c1m4_areaPreElevator_vecMin.z && vecSurvivor.z < c1m4_areaPreElevator_vecMax.z )
		 ||
		 ( vecSurvivor.x > c1m4_areaCloset_vecMin.x && vecSurvivor.x < c1m4_areaCloset_vecMax.x &&
		 vecSurvivor.y > c1m4_areaCloset_vecMin.y && vecSurvivor.y < c1m4_areaCloset_vecMax.y &&
		 vecSurvivor.z > c1m4_areaCloset_vecMin.z && vecSurvivor.z < c1m4_areaCloset_vecMax.z ) )
	{
		if ( developer() > 0 ) { printl( "Position failed validation" ); }
		return false;
	}

	if ( developer() > 0 ) { printl( "Position passed validation" ); }
	return true;
}
