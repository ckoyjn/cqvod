package com.guanglumedia.api.utils;

import java.io.PrintStream;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import java.util.Set;

public class RandomUtil
{
   private ArrayList<Integer> al = null;

  public List<Integer> createRandom(int max, int type, int num)
  {
     this.al = new ArrayList(num);

     while (this.al.size() < num) {
       int temp = (int)(Math.random() * max);
       if ((type == 1) && 
         (temp % 2 != 0))
      {
         this.al.add(Integer.valueOf(temp));
      }

       if ((type != 2) || 
         (temp % 2 != 0))
        continue;
       this.al.add(Integer.valueOf(temp));
    }

     return this.al;
  }

  public List<Integer> createRandom(int min, int max, int type, int num)
  {
     this.al = new ArrayList(num);

     while (this.al.size() < num) {
       int temp = (int)(Math.random() * max);
       if ((type == 1) && 
         (temp % 2 != 0) && (temp > min))
      {
         this.al.add(Integer.valueOf(temp));
      }

       if ((type != 2) || (temp <= min) || 
         (temp % 2 != 0))
        continue;
       this.al.add(Integer.valueOf(temp));
    }

     return this.al;
  }

  public static String GetRandomNumber()
  {
     Set set = new HashSet();

     Random random = new Random();
     while (set.size() < 4)
    {
       set.add(Integer.valueOf(random.nextInt(10)));
    }
     Iterator iterator = set.iterator();
     StringBuffer temp = new StringBuffer();
     while (iterator.hasNext()) {
       temp.append(iterator.next());
    }

     return temp.toString();
  }

  public static String GetRandomNumber6()
  {
     Set set = new HashSet();

     Random random = new Random();
     while (set.size() < 6)
    {
       set.add(Integer.valueOf(random.nextInt(10)));
    }
     Iterator iterator = set.iterator();
     StringBuffer temp = new StringBuffer();
     while (iterator.hasNext()) {
       temp.append(iterator.next());
    }

     return temp.toString();
  }

  public static void main(String[] args) {
     RandomUtil ru = new RandomUtil();
     System.out.println(GetRandomNumber6());
  }

  public static String getRandomNumberString(int strLen)
  {
     Random random = new Random();
     String ss = "0123456789";
     StringBuffer s = new StringBuffer();
     for (int i = 0; i < strLen; i++) {
       int n = random.nextInt(ss.length());
       char r = ss.charAt(n);
       s.append(r);
    }
     return s.toString();
  }
}

