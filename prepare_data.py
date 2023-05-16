import os


def generate_rgb_frames(root_dir, output_base_dir):
    for class_name in os.listdir(root_dir):
        class_root = f'{root_dir}/{class_name}'
        for file in os.listdir(class_root):
            video_file = f'{class_root}/{file}'
            file_prefix, _ = os.path.splitext(file)
            video_file_output_dir = f'{output_base_dir}/{file_prefix}'
            if not os.path.exists(video_file_output_dir):
                os.makedirs(video_file_output_dir)
            cmd_template = f'ffmpeg -i {video_file} {video_file_output_dir}/%4d.png'
            print(cmd_template)
            raise Exception


if __name__ == '__main__':
    root_dir = '/nfs/s3_common_dataset/UCF-HMDB-full/ucf101/RGB'
    output_base_dir = '/nfs/ofs-902-1/object-detection/jiangjing/experiments/CoMix/data/ucf_hmdb/ucf_videos'
    generate_rgb_frames(root_dir, output_base_dir)
