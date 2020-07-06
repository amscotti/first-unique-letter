module Tests exposing (..)

import Expect
import FirstUniqueLetter exposing (firstUniqueLetter)
import Test exposing (..)


all : Test
all =
    describe "FirstUniqueLetter"
        [ test "Should return the first unique letter" <|
            \_ ->
                Expect.equal (firstUniqueLetter "abc") (Just 'a')
        , test "Should return the first unique letter even with duplicates" <|
            \_ ->
                Expect.equal (firstUniqueLetter "aabbc") (Just 'c')
        , test "Should return the first unique letter even with duplicates not in order" <|
            \_ ->
                Expect.equal (firstUniqueLetter "abcab") (Just 'c')
        , test "Should return nothing if there is not unique letters" <|
            \_ ->
                Expect.equal (firstUniqueLetter "aabbcc") Nothing
        ]
