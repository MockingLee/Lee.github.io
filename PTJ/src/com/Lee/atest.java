package com.Lee;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

import DAO.AccountDao;
import DAO.JobDao;

public class atest
 {
    public static void main(String[] args) throws FileNotFoundException{
    
    	new JobDao().getNextAddonId();
    	
    	
   } 
} 
