
package ${YYAndroidPackageName};
import ${YYAndroidPackageName}.R;
import com.yoyogames.runner.RunnerJNILib;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.content.IntentSender;

import com.google.android.gms.auth.api.signin.GoogleSignIn;
import com.google.android.gms.auth.api.signin.GoogleSignInAccount;
import com.google.android.gms.auth.api.signin.GoogleSignInClient;
import com.google.android.gms.auth.api.signin.GoogleSignInOptions;
import com.google.android.gms.auth.api.identity.SignInClient;
import com.google.android.gms.auth.api.identity.Identity;
import com.google.android.gms.auth.api.identity.BeginSignInRequest;
import com.google.android.gms.auth.api.identity.BeginSignInRequest.PasswordRequestOptions;
import com.google.android.gms.auth.api.identity.BeginSignInRequest.GoogleIdTokenRequestOptions;
import com.google.android.gms.auth.api.identity.BeginSignInResult;
import com.google.android.gms.auth.api.identity.SignInCredential;
import com.google.android.gms.common.api.CommonStatusCodes;
import com.google.android.gms.common.api.ApiException;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.tasks.OnFailureListener;
import com.google.android.gms.tasks.OnSuccessListener;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

public class YYGoogleSignIn extends RunnerSocial
{
	private static final int EVENT_OTHER_SOCIAL = 70;	
	public static Activity activity = RunnerActivity.CurrentActivity;
	
	private static final int REQ_ONE_TAP = 635;
	
	private SignInClient oneTapClient = null;
	
	public void GoogleSignIn_Show()
	{
		Log.i("yoyo","GoogleSignIn_Show: " + String.valueOf(RunnerJNILib.extOptGetReal("GoogleSignIn", "FilterByAuthorizedAccounts") > 0.5));
		oneTapClient = Identity.getSignInClient(activity);
				
		// Retrieve the client ID and append ".apps.googleusercontent.com" to it
		String fullClientID = RunnerJNILib.extOptGetString("GoogleSignIn", "androidClientID") + ".apps.googleusercontent.com";

		// Build the sign-in request with the modified client ID
		BeginSignInRequest signInRequest = BeginSignInRequest.builder()
			//.setPasswordRequestOptions(PasswordRequestOptions.builder().setSupported(true).build())
			.setGoogleIdTokenRequestOptions(GoogleIdTokenRequestOptions.builder()
				.setSupported(true)
				.setServerClientId(fullClientID)  // Use the appended client ID
				.setFilterByAuthorizedAccounts(RunnerJNILib.extOptGetReal("GoogleSignIn", "FilterByAuthorizedAccounts") > 0.5)
				.build()
			)
			.setAutoSelectEnabled(true)
			.build();
			  
		oneTapClient.beginSignIn(signInRequest).addOnSuccessListener(activity, new OnSuccessListener<BeginSignInResult>() 
		{
			@Override
			public void onSuccess(BeginSignInResult result)
			{
				try 
				{
					activity.startIntentSenderForResult(result.getPendingIntent().getIntentSender(), REQ_ONE_TAP,null, 0, 0, 0);
				} 
				catch (IntentSender.SendIntentException e) 
				{
					Log.e("yoyo", "GoogleSignIn Error Catch: Couldn't start One Tap UI: " + e.getLocalizedMessage());
					
					int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
					RunnerJNILib.DsMapAddString(dsMapIndex, "type", "GoogleSignIn_Show");
					RunnerJNILib.DsMapAddDouble(dsMapIndex, "success", 0.0);
					RunnerJNILib.CreateAsynEventWithDSMap( dsMapIndex, EVENT_OTHER_SOCIAL);
				}
			}
		}).addOnFailureListener(activity, new OnFailureListener() 
		{
			@Override
			public void onFailure(@NonNull Exception e) 
			{
				Log.d("yoyo", "GoogleSignIn onFailure: " + e.getLocalizedMessage());
				
				int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
				RunnerJNILib.DsMapAddString(dsMapIndex, "type", "GoogleSignIn_Show");
				RunnerJNILib.DsMapAddDouble(dsMapIndex, "success", 0.0);
				RunnerJNILib.CreateAsynEventWithDSMap( dsMapIndex, EVENT_OTHER_SOCIAL);
			}
		});
	}

	public void onActivityResult(int requestCode, int resultCode, Intent data) 
	{
		switch(requestCode)
		{
			case REQ_ONE_TAP:
			
				try 
				{
					SignInCredential credential = oneTapClient.getSignInCredentialFromIntent(data);
					
					// https://developers.google.com/android/reference/com/google/android/gms/auth/api/signin/GoogleSignInAccount

					int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
					RunnerJNILib.DsMapAddString(dsMapIndex, "type", "GoogleSignIn_Show");
					RunnerJNILib.DsMapAddDouble(dsMapIndex, "success", 1.0);
					
					if(credential.getGoogleIdToken() != null)
						RunnerJNILib.DsMapAddString(dsMapIndex, "idToken",credential.getGoogleIdToken());
					
					// if(credential.getDisplayName() != null)
						// RunnerJNILib.DsMapAddString(dsMapIndex,"displayName",credential.getDisplayName());
					// if(credential.getFamilyName() != null)
						// RunnerJNILib.DsMapAddString(dsMapIndex, "familyName",credential.getFamilyName());
					// if(credential.getGivenName() != null)
						// RunnerJNILib.DsMapAddString(dsMapIndex, "givenName",credential.getGivenName());
					// if(credential.getId() != null)
						// RunnerJNILib.DsMapAddString(dsMapIndex, "email",credential.getId());
					// if(credential.getPassword() != null)
						// RunnerJNILib.DsMapAddString(dsMapIndex, "password",credential.getPassword());
					// if(credential.getProfilePictureUri() != null)
						// RunnerJNILib.DsMapAddString(dsMapIndex, "pictureUri",credential.getProfilePictureUri());
					
					RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex,EVENT_OTHER_SOCIAL);
				} 
				catch(ApiException e) 
				{
					switch (e.getStatusCode()) 
					{
						case CommonStatusCodes.CANCELED:
							Log.d("yoyo", "GoogleSignIn CANCELED  One-tap dialog was closed.");
						break;
						
						case CommonStatusCodes.NETWORK_ERROR:
							Log.d("yoyo", "GoogleSignIn NETOWRK ERROR One-tap encountered a network error.");
						break;
						
						default:
							Log.d("yoyo", "GoogleSignIn ERROR Couldn't get credential from result." + e.getLocalizedMessage());
						break;
					}
					
					int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
					RunnerJNILib.DsMapAddString(dsMapIndex, "type", "GoogleSignIn_Show");
					RunnerJNILib.DsMapAddDouble(dsMapIndex, "success", 0.0);
					RunnerJNILib.CreateAsynEventWithDSMap( dsMapIndex, EVENT_OTHER_SOCIAL);
				}
				
			break;
		}
	}
	
	public void GoogleSignIn_SignOut()
	{
		if (oneTapClient == null)
		{
			Log.d("yoyo", "GoogleSignIn_SignOut: Sign out successful.");
			int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
			RunnerJNILib.DsMapAddString(dsMapIndex, "type", "GoogleSignIn_SignOut");
			RunnerJNILib.DsMapAddDouble(dsMapIndex, "success", 1.0);
			RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
			return;
		}
	
		oneTapClient.signOut()
		.addOnSuccessListener(new OnSuccessListener<Void>() 
		{
				@Override
				public void onSuccess(Void result) {
					Log.d("yoyo", "GoogleSignIn_SignOut: Sign out successful.");
					int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
					RunnerJNILib.DsMapAddString(dsMapIndex, "type", "GoogleSignIn_SignOut");
					RunnerJNILib.DsMapAddDouble(dsMapIndex, "success", 1.0);
					RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
					
					oneTapClient = null;
				}
		})
		.addOnFailureListener(new OnFailureListener() 
		{
			@Override
			public void onFailure(@NonNull Exception e) 
			{
				Log.e("yoyo", "GoogleSignIn_SignOut Error: " + e.getLocalizedMessage());
				int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
				RunnerJNILib.DsMapAddString(dsMapIndex, "type", "GoogleSignIn_SignOut");
				RunnerJNILib.DsMapAddDouble(dsMapIndex, "success", 0.0);
				RunnerJNILib.DsMapAddString(dsMapIndex, "error", e.getLocalizedMessage());
				RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
			}
		});
	}
}