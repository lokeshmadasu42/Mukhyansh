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

## Installation
To use this code, you need to have Python 3.7.11 installed. You can install the required Python packages using pip:

```bash
pip3 install -r requirements.txt
```

## Models

### Fine-tune mT5-small Model
To fine-tune the mT5-small model, run the following command:

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
    --predict_with_generate $@ 2>&1>./hg_mt5_log.txt

```

### Fine-tune IndicBARTSS Model
To fine-tune the IndicBARTSS model, run the following command:

```bash
python3 run_summarization.py \
    --model_name_or_path ai4bharat/IndicBARTSS \
    --do_train True \
    --do_eval True \
    --do_predict True \
    --source_prefix "summarize: " \
    --lang_id '<2te>' \
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
    --predict_with_generate $@ 2>&1>./hg_ssib_log.txt

```


***Note: For fine-tuning IndicBARTSS model, you should include `--lang_id` argument in the above command. For example, if you are doing it for Telugu language the `lang_id` will be `<2te>`. Here is the list of language id's: `<2te>`,`<2ta>`,`<2kn>`,`<2ml>`,`<2hi>`,`<2bn>`,`<2mr>`,`<2gu>`.***

## Benchmarks

Multilingual ROUGE-L scores of various baseline models of Mukhyansh for each language.

| Language | FastText+LSTM | FastText+GRU | BPEmb+GRU | mT5-small | IndicBARTSS |
|---------|--------------|-------------|----------|----------|------|
| te      | 32.02        | 32.70       | 29.31    | 38.35    | 37.33|
| ta      | 32.20        | 31.26       | 32.04    | 41.18    | 41.16|
| kn      | 25.25        | 22.84       | 23.60    | 33.34    | 32.59|
| ml      | 28.17        | 23.44       | 25.36    | 34.63    | 32.04|
| hi      | 29.50        | 28.45       | 28.94    | 33.65    | 36.18|
| bn      | 17.47        | 14.90       | 9.84     | 21.56    | 22.04|
| mr      | 16.83        | 14.04       | 17.54    | 26.41    | 27.08|
| gu      | 14.84        | 9.48        | 14.94    | 20.43    | 23.05|
| Avg     | 24.54        | 22.14       | 22.70    | 31.19    | 31.43|

### Hyper-parameters

| Parameters         | Seq-Seq(FastText) | Seq-Seq(BPEmb) | mT5-small | IndicBARTSS |
|--------------------|-------------------|----------------|-----------|------------|
| Max Source Length  | 200               | 300            | 1024      | 1024       |
| Max Target Length  | 20                | 30             | 30        | 30         |
| Vocabulary Size    | 40000             | 40000          | 250112    | 64000      |
| Beam Width         | 5                 | 5              | 4         | 4          |
| Batch Size         | 16                | 16             | 16        | 16         |
| Optimizer          | Adam              | Adam           | Adam      | Adam       |
| Learning Rate      | 1e-4              | 1e-4           | 5e-5      | 5e-5       |
| (GPU, CPU)         | (1,10)            | (1,10)         | (4,40)    | (4,40)     |



## License
Contents of this repository are restricted to only non-commercial research purposes under the [Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License (CC BY-NC-SA 4.0)](https://creativecommons.org/licenses/by-nc-sa/4.0/). Copyright of the dataset contents belongs to the original copyright holders.

## Citation
If you use any of the datasets, models or code modules, please cite the following paper:

```
Will be updated.
```
