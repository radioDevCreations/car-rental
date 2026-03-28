public with sharing class CR_TransactionStaticData {

    private static User currentUser;
    private static Id currentUserId;
    private static String currentUserName;
    private static String currentUserEmail;

    private static Boolean isInitialized = false;

    private static void init() {
        if (isInitialized) {
            return;
        }

        currentUserId = UserInfo.getUserId();

        currentUser = [
            SELECT Id, Name, Email
            FROM User
            WHERE Id = :currentUserId
            LIMIT 1
        ];

        currentUserName = currentUser.Name;
        currentUserEmail = currentUser.Email;

        isInitialized = true;
    }

    public static User getCurrentUser() {
        init();
        return currentUser;
    }

    public static Id getCurrentUserId() {
        init();
        return currentUserId;
    }

    public static String getCurrentUserName() {
        init();
        return currentUserName;
    }

    public static String getCurrentUserEmail() {
        init();
        return currentUserEmail;
    }

    @TestVisible
    public static void reset() {
        currentUser = null;
        currentUserId = null;
        currentUserName = null;
        currentUserEmail = null;
        isInitialized = false;
    }
}