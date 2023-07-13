#!/bin/bash

ROOT=./

bash /nfs/volume-902-16/tangwenbo/ofs-1.sh

cd /nfs/ofs-902-1/object-detection/jiangjing/experiments/CoMix && CUDA_VISIBLE_DEVICES=0,1,2,3 /home/luban/apps/miniconda/miniconda/envs/torch1101/bin/python \
  $ROOT/main.py --manual_seed 1 --dataset_name Epic-Kitchens \
  --src_dataset "$1" --tgt_dataset "$2" \
  --batch_size 8 --model_root "$3" \
  --save_in_steps 500 --log_in_steps 50 --eval_in_steps 50 --pseudo_threshold 0.7 \
  --warmstart_models True --num_iter_warmstart 1000 --num_iter_adapt 2500 \
  --learning_rate 0.01 --learning_rate_ws 0.01 --lambda_bgm 0.01 --lambda_tpl 0.01 \
  --base_dir /nfs/ofs-902-1/object-detection/jiangjing/datasets/epic_kitchens \
  --warmstart_graph $4 --warmstart_i3d $5
