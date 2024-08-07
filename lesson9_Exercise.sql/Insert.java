/* List9-7 更新SQL文を発行してテーブルのデータを更新するJavaプログラム */
import java.sql.*;

public class Insert{
     public static void main(String[] args) throws Exception {

          /* 1) PostgreSQLへの接続情報 */
          Connection con; 
          Statement st;

          String url = "jdbc:postgresql://localhost:5432/shop";
          String user = "user";
          String password = "xxx"; 


          /* 2) JDBCドライバの定義 */
          Class.forName("org.postgresql.Driver");

          /* 3) PostgreSQLへの接続 */
          con = DriverManager.getConnection(url, user, password);
          st = con.createStatement();

          /* 4) */
          int inscnt = 0;
          inscnt = st.executeUpdate("INSERT INTO Shohin VALUES ('0001', 'Tシャツ', '衣服', 1000, 500, '2009-09-20')");
          System.out.println(inscnt + "行挿入されました");
          inscnt = st.executeUpdate("INSERT INTO Shohin VALUES ('0002', '穴あけパンチ', '事務用品', 500, 320, '2009-09-11')");
          System.out.println(inscnt + "行挿入されました");
          inscnt = st.executeUpdate("INSERT INTO Shohin VALUES ('0003', 'カッターシャツ', '衣服', 4000, 2800, NULL)");
          System.out.println(inscnt + "行挿入されました");
          inscnt = st.executeUpdate("INSERT INTO Shohin VALUES ('0004', '包丁', 'キッチン用品', 3000, 2800, '2009-09-20')");
          System.out.println(inscnt + "行挿入されました");
          inscnt = st.executeUpdate("INSERT INTO Shohin VALUES ('0005', '圧力鍋', 'キッチン用品', 6800, 5000, '2009-01-15')");
          System.out.println(inscnt + "行挿入されました");
          inscnt = st.executeUpdate("INSERT INTO Shohin VALUES ('0006', 'フォーク', 'キッチン用品', 500, NULL, '2009-09-20')");
          System.out.println(inscnt + "行挿入されました");
          inscnt = st.executeUpdate("INSERT INTO Shohin VALUES ('0007', 'おろしがね', 'キッチン用品', 880, 790, '2008-04-28')");
          System.out.println(inscnt + "行挿入されました");
          inscnt = st.executeUpdate("INSERT INTO Shohin VALUES ('0008', 'ボールペン', '事務用品', 100, NULL, '2009-11-11')");
          System.out.println(inscnt + "行挿入されました");

          /* 6) PostgreSQLとの接続を切断 */
          st.close();
          con.close();
     }
}