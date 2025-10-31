#!/bin/bash
echo ">>> Updating Retweets"
gallery-dl --abort 3 --sleep 4 -o retweets=true "https://x.com/stefenauris"
gallery-dl --abort 3 --sleep 4 -o retweets=true "https://x.com/DaybreakHero"
echo ">>> Downloading Special Pics in alphabetical order..."
array=(
  AFoxyGent
  AgonyLight
  AidanEnormouse
  AlienSymbol
  angel_pubby
  Aquafighter_Dai
  BakedBaxxie
  Calilum_
  cheetah_paws
  DanielsWolf1
  DoggoStahl
  Duke_Doberman
  FrayeVfraye
  FullPurp
  growstav
  himbohyena
  HYDROKIINESIS
  JosephBuffWuff
  Joshontwt
  K1ngYeen
  lobogriswrestle
  lucthelab
  LukaBuck
  _maxsmall
  Metal_AnimalMan
  Milesfuzz
  PalaceWolf_
  pec_inspector
  PupBuday
  Pup_Krypto
  PupPanic
  PupShade
  pupzanderwoodz
  RingerShep
  ronnoyeen
  rubberbeefcake
  sciopup
  SmileyBots
  SwiftLPRD
  TehBasco
  theonlyinleb
  the_generalguy
  ThunderMaxy
  t_kobs
  Tworld99
  VectorShen
  WeaselAfterDark
  WeaselZERO
  wolf_ezo
  Wolf_ODaddy
  WolfSandman
  Wolfy_WolFang
  yamasmut
)
for i in "${array[@]}"; do
  gallery-dl --sleep 4 --abort 3 https://x.com/"$i" || echo "  >>>  Issue downloading $i" | tee ~/special_error.txt
done
