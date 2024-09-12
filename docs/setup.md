
@title Setup

The Google Sign In extension requires the developer to provide the web client Id for the project
the user is signing In to. To get this identifier the user can follow the following steps:

1. Go to Google Cloud Platform [Credentials and APIs](https://console.cloud.google.com/apis/credentials) page and select your project.

2. On the top of the screen click to Create Credentials

![](assets/gsi_create_credentials.png)

3. Select the OAuth client ID option from the dropdown.

![](assets/gsi_oauth_client_id.png)

4. For application type select Web Application and then give your OAuth client ID a name.

![](assets/gsi_type_and_name.png)

5. Done, you should now be ready to use the Google SignIn Extension by providing the ID that can be found in the image below (click in the icon to copy the Web Client ID).

![](assets/gsi_overview.png)

> [!IMPORTANT]
> When entering the Client ID into the extension options make sure you remove the extra `".apps.googleusecontent.com"` and only provide the UUID.