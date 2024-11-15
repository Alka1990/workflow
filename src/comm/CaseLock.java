// Source code is decompiled from a .class file using FernFlower decompiler.
package comm;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

public class CaseLock {
    private static final int List = 0;
    public static Map<String, Map<String, Timestamp>> caseLockMap = new HashMap();

    public CaseLock() {
    }

    public static void setCaseLock(String caseId, String userId) {
        userId = userId.toUpperCase();
        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        Map<String, Timestamp> userTimeMap = new HashMap();
        userTimeMap.put(userId, timestamp);
        caseLockMap.put(caseId, userTimeMap);
        System.out.println("you are done");
    }

    public static String getCaseLock(String caseId, String userId) {
        userId = userId.toUpperCase();
        String caseLock = "N";
        Iterator<Map.Entry<String, Map<String, Timestamp>>> itr = caseLockMap.entrySet().iterator();

        while (true) {
            Map.Entry entry;
            do {
                if (!itr.hasNext()) {
                    return caseLock;
                }

                System.out.println("getCaseLock() invoked");
                entry = (Map.Entry) itr.next();
                System.out.println("Key = " + (String) entry.getKey() + ", Value = " + entry.getValue());
            } while (!((String) entry.getKey()).equals(caseId));

            Map<String, Timestamp> userTimeMap = (Map) entry.getValue();
            Iterator<Map.Entry<String, Timestamp>> itrins = userTimeMap.entrySet().iterator();

            while (itrins.hasNext()) {
                Map.Entry<String, Timestamp> entryins = (Map.Entry) itrins.next();
                System.out.println(
                        "entryins Key = " + (String) entryins.getKey() + ", entryins Value = " + entryins.getValue());
                if (!((String) entryins.getKey()).equals(userId)) {
                    Timestamp timestamp = new Timestamp(System.currentTimeMillis());
                    System.out.println("timestamp " + timestamp);
                    caseLock = "Y";
                    double difference = (double) (timestamp.getTime() - ((Timestamp) entryins.getValue()).getTime());
                    System.out.println("difference " + difference);
                    if (difference < 30000.0) {
                        caseLock = String.valueOf(userId.toLowerCase()) + "~" + (String) entryins.getKey();
                        System.out.println("fdhjfurf   " + caseLock);
                        System.out.println("Not Allowed to Login");
                    }
                }
            }
        }
    }
}
