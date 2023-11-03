# Mukhyansh

This repository is dedicated to the paper titled [**"Mukhyansh: A Headline Generation Dataset for Indic Languages"**](). Here, you will find the following resources:

1. **Dataset**: Will be released soon.

2. **Model Checkpoints**: Will be released soon.

3. **Code**: Will be released soon.

## Table of Contents

- [Mukhyansh](#Mukhyansh)
  - [Dataset](#dataset)
  - [Models](#models)
  - [Benchmarks](#benchmarks)
  - [License](#license)
  - [Citation](#citation)

## Dataset
***Disclaimer: You must agree to the [license](#license) and terms of use before using the dataset.***
Todo : Dataset Stats table and Category wise counts table. List of websites used for scraping.

## Models
Please run the following command to Fine-tune the transformer models such as mT5-small and IndicBARTSS.
```bash
python3 run_summarization.py \
    --model_name_or_path google/mt5-small \
    --do_train True \
    --do_eval True \
    --do_predict True \
    --source_prefix "summarize: " \
    --train_file <path to the '.jsonl' or '.csv' file> \
    --validation_file <path to the '.jsonl' or '.csv' file> \
    --test_file <path to the '.jsonl' or '.csv' file> \
    --max_target_length <Specify the maximum target sequence length> \
    --output_dir <path to the output directory> \
    --per_device_train_batch_size=4 \
    --per_device_eval_batch_size=4 \
    --num_train_epochs 10 \
    --logging_strategy "epoch" \
    --save_strategy "epoch" \
    --evaluation_strategy "epoch" \
    --overwrite_output_dir True \
    --predict_with_generate $@ 2>&1>./hg_log.txt

```
***Note: For fine-tuning IndicBARTSS model, you should include `--lang_id` argument in the above command. For example, if you are doing it for Telugu language the `lang_id` will be `<2te>`. Here is the list of language id's: `<2te>`,`<2ta>`,`<2kn>`,`<2ml>`,`<2hi>`,`<2bn>`,`<2mr>`,`<2gu>`.***

## License
Contents of this repository are restricted to only non-commercial research purposes under the [Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License (CC BY-NC-SA 4.0)](https://creativecommons.org/licenses/by-nc-sa/4.0/). Copyright of the dataset contents belongs to the original copyright holders.

## Citation
If you use any of the datasets, models or code modules, please cite the following paper:

```
Will be updated.
```
