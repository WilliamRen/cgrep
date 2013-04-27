--
-- Copyright (c) 2013 Bonelli Nicola <bonelli@antifork.org>
--
-- This program is free software; you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation; either version 2 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program; if not, write to the Free Software
-- Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
--

module CGrep.Util where

import CGrep.Options
import CGrep.Output
import CGrep.StringLike


basicGrep :: (StringLike a) => Options -> FilePath -> [a] -> (Int, a) -> [Output]
basicGrep opt f patterns (n, line) =
    if null patfilt
      then []
      else [Output f n line (map slToString patfilt)]
    where patfilt = slGrep (word opt) (invert_match opt) patterns line  

