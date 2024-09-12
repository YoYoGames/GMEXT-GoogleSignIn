// FUNCTIONS

/**
 * @func GoogleSignIn_Show
 * @desc Shows the google overlay popup to select a google account to sign up with.
 * 
 * @event social
 * @member {string} type The string value `"GoogleSignIn_Show"`
 * @member {boolean} success Whether or not the requested task was successful
 * @member {string} idToken An ID token (authentication token) that you can send to your server.
 * @event_end
 * 
 * @func_end
 */

/**
 * @func GoogleSignIn_SignOut
 * @desc Signs out the current signed-in user if any.
 * 
 * [[Warning: This function is not compatible with HTML5 and will result in a no-op call]]
 * 
 * @event social
 * @member {string} type The string value `"GoogleSignIn_SignOut"`
 * @member {boolean} success Whether or not the requested task was successful
 * @event_end
 * 
 * @func_end
 */

// MODULES

/**
 * @module home
 * @title Google Sign-In
 * @desc Google Sign-In manages the OAuth 2.0 flow and token lifecycle, simplifying your integration with Google APIs.
 * 
 * * Show sign-in account selector
 * * Sign out of your account
 * 
 * @section Guides
 * @desc This section contains guides to get started with the Google Sign-In extension.
 * @ref page.setup
 * @section_end
 * 
 * @section_func Functions
 * @desc This is the list of available functions for the Google Sign-In extension. 
 * @ref GoogleSignIn_Show
 * @ref GoogleSignIn_SignOut
 * @section_end
 * 
 * @module_end
 */
