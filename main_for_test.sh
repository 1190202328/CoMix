#!/bin/bash

CUDA_VISIBLE_DEVICES=0 python main_for_test.py \
  --manual_seed 1 --dataset_name UCF-HMDB --src_dataset UCF --tgt_dataset HMDB \
  --batch_size 1 --model_root ./checkpoints_ucf_hmdb \
  --save_in_steps 500 --log_in_steps 50 --eval_in_steps 50 \
  --pseudo_threshold 0.7 \
  --num_iter_warmstart 4000 --num_iter_adapt 10000 \
  --learning_rate 0.01 --learning_rate_ws 0.01 \
  --lambda_bgm 0.1 --lambda_tpl 0.01 \
  --base_dir ./data/ucf_hmdb \
  --warmstart_models False
#  --warmstart_models True # 进行warmstart_models的话，相当于先进行source-only的训练，再进行DA
