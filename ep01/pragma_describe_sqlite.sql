/*
 * Example of using a describe table into the sqlite database
 * To describe a table, in sqlite, we using the clause PRAGMA
 * The table_info pragma is used to query information about a specific table. 
 * The result set will contain one row for each column in the table. Column name. Column type.
 */

PRAGMA table_info(tb_sellers)