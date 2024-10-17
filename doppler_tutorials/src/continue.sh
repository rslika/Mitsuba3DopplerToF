basedir=../
name="doppler_point_correlated_sampler_forward"
name="doppler_point_correlated_sampler_ball"
fix=".xml"
for i in {0..6} 
do
  xml=$name$i$fix
  python main_experiment.py --scene_name cornell-box --wave_function_type sinusoidal --basedir $basedir --expnumber 0 --xml $xml --no $i
done
