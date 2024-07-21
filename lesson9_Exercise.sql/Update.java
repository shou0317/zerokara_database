/* List9-7 更新SQL文を発行してテーブルのデータを更新するJavaプログラム */
import java.sql.*;

public class Update{
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
          int updcnt = 0;
          updcnt += st.executeUpdate("UPDATE Shohin SET shohin_mei = 'Yシャツ' WHERE shohin_id = '0001'");

          /* 5) 結果の画面表示 */
          System.out.print(updcnt + "行更新されました");

          /* 6) PostgreSQLとの接続を切断 */
          st.close();
          con.close();
     }
}