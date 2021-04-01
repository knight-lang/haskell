{-# LANGUAGE FlexibleInstances #-}
module Main where

import Parser
import Evaluator
import qualified Knight.Parse
import qualified Knight.Evaluate

import Data.Maybe
import qualified Data.Map

main = do
  let
    Just code = snd $ parse Knight.Parse.value ("\
;=_n0 1706;=_n1 1466;=_n2 1427;=_n3 1744;=_n4 1684;=_n5 1386;=_n6 2001;=_n7 1750;=_n8 1753;=_n9 1770;=_n10 1559;=_n11 1616;=_n12 1408;=_n13 1860;=_n14 1940;=_n15 2002;=_n16 1862;=_n17 1918;=_n18 1456;=_n19 1209;=_n20 1840;=_n21 1462;=_n22 1783;=_n23 1644;=_n24 1901;=_n25 1791;=_n26 1506;=_n27 2005;=_n28 1338;=_n29 1383;=_n30 1420;=_n31 1631;=_n32 1784;=_n33 1897;=_n34 1771;=_n35 1588;=_n36 1955;=_n37 1937;=_n38 1392;=_n39 1396;=_n40 1803;=_n41 1429;=_n42 1407;=_n43 1698;=_n44 1562;=_n45 1913;=_n46 1678;=_n47 1198;=_n48 1398;=_n49 1703;=_n50 1831;=_n51 1489;=_n52 1782;=_n53 1864;=_n54 1708;=_n55 1397;=_n56 1915;=_n57 1953;=_n58 1395;=_n59 1610;=_n60 1549;=_n61 1564;=_n62 1973;=_n63 1931;=_n64 2009;=_n65 1980;=_n66 1800;=_n67 1443;=_n68 1993;=_n69 1900;=_n70 1964;=_n71 1581;=_n72 1904;=_n73 1665;=_n74 1567;=_n75 1057;=_n76 1805;=_n77 1402;=_n78 1878;=_n79 1729;=_n80 1825;=_n81 1682;=_n82 1719;=_n83 1469;=_n84 1004;=_n85 1591;=_n86 1594;=_n87 811;=_n88 1523;=_n89 1424;=_n90 1756;=_n91 373;=_n92 1442;=_n93 1718;=_n94 1411;=_n95 1892;=_n96 1820;=_n97 1977;=_n98 1871;=_n99 1890;=_n100 1653;=_n101 1372;=_n102 1475;=_n103 1476;=_n104 1422;=_n105 2004;=_n106 1755;=_n107 1676;=_n108 639;=_n109 1425;=_n110 1853;=_n111 1712;=_n112 1525;=_n113 1514;=_n114 1455;=_n115 1658;=_n116 1963;=_n117 1579;=_n118 1861;=_n119 1458;=_n120 1474;=_n121 1613;=_n122 1681;=_n123 1586;=_n124 1441;=_n125 1499;=_n126 1865;=_n127 1735;=_n128 1989;=_n129 1952;=_n130 792;=_n131 1669;=_n132 1509;=_n133 1481;=_n134 1893;=_n135 1445;=_n136 1834;=_n137 1779;=_n138 1732;=_n139 1826;=_n140 1595;=_n141 1829;=_n142 449;=_n143 1920;=_n144 1707;=_n145 1780;=_n146 1935;=_n147 1867;=_n148 1769;=_n149 1107;=_n150 919;=_n151 1382;=_n152 1604;=_n153 1875;=_n154 1453;=_n155 1496;=_n156 1946;=_n157 1659;=_n158 1570;=_n159 1692;=_n160 1630;=_n161 1638;=_n162 1922;=_n163 1691;=_n164 1580;=_n165 1880;=_n166 1482;=_n167 1762;=_n168 1775;=_n169 1376;=_n170 1434;=_n171 1856;=_n172 1971;=_n173 1646;=_n174 1951;=_n175 1416;=_n176 1889;=_n177 1773;=_n178 1814;=_n179 1471;=_n180 1488;=_n181 1736;=_n182 1743;=_n183 1459;=_n184 1389;=_n185 1498;=_n186 1663;=_n187 1611;=_n188 1727;=_n189 1699;=_n190 1624;=_n191 1511;=_n192 1767;=_n193 1754;=_n194 1785;=_n195 1491;=_n196 1235;=_n197 1510;=_n198 1500;=_n199 1485
;=i 0
;W>200i
  ;=j 0
  ;W>200j
    ;=x+i j
    :I&<2021x>2019x
      ;O*i j
      :Q
      :=j+1j
  :=i+1i
: N
      \" )
-- \ ; = fact F \
--   \ I (< x 1) \
--     \ 1 \
--     \ ; = x (- x 1) \
--       \ * (+ 1 x) (C fact) \
-- \ ; = x 10 \
-- \ O C fact \
    env = Data.Map.empty :: Env

  eval (Knight.Evaluate.value code) env
  print ()
  -- let (_, value) = print $ eval $ fromMaybe $ snd $ parse value "* 3 + 4 2"
-- main = do
--   print $ parse random "3hi42xs8fhdb35(94-$w:"
--   print $ parse randomBreak "3 hello world !! 5 cut short BREAK 3 hello there kenobi"
