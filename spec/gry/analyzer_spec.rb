require 'spec_helper'

describe Gry::Analyzer do
  describe '#analyze' do
    shared_examples 'returns_a_valid_rubocop_yml' do
      it 'returns a valid .rubocop.yml' do
        expect(analyze).to be_a Hash
        expect(analyze.keys).to be_all{|key| cops.include?(key)}
        expect(analyze.values).to be_all{|value| value.is_a?(Hash)}
      end
    end

    let(:analyzer){Gry::Analyzer.new(cops, parallel: parallel)}
    let(:parallel){true}
    subject(:analyze){analyzer.analyze}

    context 'with all cops' do
      let(:cops){Gry::RubocopAdapter.configurable_cops}

      include_examples 'returns_a_valid_rubocop_yml'
    end

    context 'non parallel mode' do
      let(:parallel){false}
      let(:cops){Gry::RubocopAdapter.configurable_cops}

      include_examples 'returns_a_valid_rubocop_yml'
    end
  end

  describe '#cop_configs' do
    shared_examples 'returns_cop_configs' do |cop_name, expected|
      it "returns cop configs for #{cop_name}" do
        analyzer = Gry::Analyzer.new([cop_name], parallel: true)
        config = analyzer.__send__(:cop_configs, cop_name)
        expect(config).to eq expected
      end
    end

    include_examples 'returns_cop_configs', 'Style/AndOr', [
      {
        'Style/AndOr' => {
          'EnforcedStyle' => 'always'
        },
      },
      {
        'Style/AndOr' => {
          'EnforcedStyle' => 'conditionals'
        },
      }
    ]

    include_examples 'returns_cop_configs', 'Style/NumericLiteralPrefix', [
      {
        'Style/NumericLiteralPrefix' => {
          'EnforcedOctalStyle' => 'zero_with_o'
        },
      },
      {
        'Style/NumericLiteralPrefix' => {
          'EnforcedOctalStyle' => 'zero_only'
        },
      }
    ]

    include_examples 'returns_cop_configs', 'Style/AlignHash', [
      {
        'Style/AlignHash' => {
          'EnforcedHashRocketStyle' => 'key',
          'EnforcedColonStyle' => 'key',
          'EnforcedLastArgumentHashStyle' => 'always_inspect',
        },
      },
      {
        'Style/AlignHash' => {
          'EnforcedHashRocketStyle' => 'key',
          'EnforcedColonStyle' => 'key',
          'EnforcedLastArgumentHashStyle' => 'always_ignore',
        },
      },
      {
        'Style/AlignHash' => {
          'EnforcedHashRocketStyle' => 'key',
          'EnforcedColonStyle' => 'key',
          'EnforcedLastArgumentHashStyle' => 'ignore_implicit',
        },
      },
      {
        'Style/AlignHash' => {
          'EnforcedHashRocketStyle' => 'key',
          'EnforcedColonStyle' => 'key',
          'EnforcedLastArgumentHashStyle' => 'ignore_explicit',
        },
      },

      {
        'Style/AlignHash' => {
          'EnforcedHashRocketStyle' => 'key',
          'EnforcedColonStyle' => 'separator',
          'EnforcedLastArgumentHashStyle' => 'always_inspect',
        },
      },
      {
        'Style/AlignHash' => {
          'EnforcedHashRocketStyle' => 'key',
          'EnforcedColonStyle' => 'separator',
          'EnforcedLastArgumentHashStyle' => 'always_ignore',
        },
      },
      {
        'Style/AlignHash' => {
          'EnforcedHashRocketStyle' => 'key',
          'EnforcedColonStyle' => 'separator',
          'EnforcedLastArgumentHashStyle' => 'ignore_implicit',
        },
      },
      {
        'Style/AlignHash' => {
          'EnforcedHashRocketStyle' => 'key',
          'EnforcedColonStyle' => 'separator',
          'EnforcedLastArgumentHashStyle' => 'ignore_explicit',
        },
      },

      {
        'Style/AlignHash' => {
          'EnforcedHashRocketStyle' => 'key',
          'EnforcedColonStyle' => 'table',
          'EnforcedLastArgumentHashStyle' => 'always_inspect',
        },
      },
      {
        'Style/AlignHash' => {
          'EnforcedHashRocketStyle' => 'key',
          'EnforcedColonStyle' => 'table',
          'EnforcedLastArgumentHashStyle' => 'always_ignore',
        },
      },
      {
        'Style/AlignHash' => {
          'EnforcedHashRocketStyle' => 'key',
          'EnforcedColonStyle' => 'table',
          'EnforcedLastArgumentHashStyle' => 'ignore_implicit',
        },
      },
      {
        'Style/AlignHash' => {
          'EnforcedHashRocketStyle' => 'key',
          'EnforcedColonStyle' => 'table',
          'EnforcedLastArgumentHashStyle' => 'ignore_explicit',
        },
      },


      {
        'Style/AlignHash' => {
          'EnforcedHashRocketStyle' => 'separator',
          'EnforcedColonStyle' => 'key',
          'EnforcedLastArgumentHashStyle' => 'always_inspect',
        },
      },
      {
        'Style/AlignHash' => {
          'EnforcedHashRocketStyle' => 'separator',
          'EnforcedColonStyle' => 'key',
          'EnforcedLastArgumentHashStyle' => 'always_ignore',
        },
      },
      {
        'Style/AlignHash' => {
          'EnforcedHashRocketStyle' => 'separator',
          'EnforcedColonStyle' => 'key',
          'EnforcedLastArgumentHashStyle' => 'ignore_implicit',
        },
      },
      {
        'Style/AlignHash' => {
          'EnforcedHashRocketStyle' => 'separator',
          'EnforcedColonStyle' => 'key',
          'EnforcedLastArgumentHashStyle' => 'ignore_explicit',
        },
      },

      {
        'Style/AlignHash' => {
          'EnforcedHashRocketStyle' => 'separator',
          'EnforcedColonStyle' => 'separator',
          'EnforcedLastArgumentHashStyle' => 'always_inspect',
        },
      },
      {
        'Style/AlignHash' => {
          'EnforcedHashRocketStyle' => 'separator',
          'EnforcedColonStyle' => 'separator',
          'EnforcedLastArgumentHashStyle' => 'always_ignore',
        },
      },
      {
        'Style/AlignHash' => {
          'EnforcedHashRocketStyle' => 'separator',
          'EnforcedColonStyle' => 'separator',
          'EnforcedLastArgumentHashStyle' => 'ignore_implicit',
        },
      },
      {
        'Style/AlignHash' => {
          'EnforcedHashRocketStyle' => 'separator',
          'EnforcedColonStyle' => 'separator',
          'EnforcedLastArgumentHashStyle' => 'ignore_explicit',
        },
      },

      {
        'Style/AlignHash' => {
          'EnforcedHashRocketStyle' => 'separator',
          'EnforcedColonStyle' => 'table',
          'EnforcedLastArgumentHashStyle' => 'always_inspect',
        },
      },
      {
        'Style/AlignHash' => {
          'EnforcedHashRocketStyle' => 'separator',
          'EnforcedColonStyle' => 'table',
          'EnforcedLastArgumentHashStyle' => 'always_ignore',
        },
      },
      {
        'Style/AlignHash' => {
          'EnforcedHashRocketStyle' => 'separator',
          'EnforcedColonStyle' => 'table',
          'EnforcedLastArgumentHashStyle' => 'ignore_implicit',
        },
      },
      {
        'Style/AlignHash' => {
          'EnforcedHashRocketStyle' => 'separator',
          'EnforcedColonStyle' => 'table',
          'EnforcedLastArgumentHashStyle' => 'ignore_explicit',
        },
      },


      {
        'Style/AlignHash' => {
          'EnforcedHashRocketStyle' => 'table',
          'EnforcedColonStyle' => 'key',
          'EnforcedLastArgumentHashStyle' => 'always_inspect',
        },
      },
      {
        'Style/AlignHash' => {
          'EnforcedHashRocketStyle' => 'table',
          'EnforcedColonStyle' => 'key',
          'EnforcedLastArgumentHashStyle' => 'always_ignore',
        },
      },
      {
        'Style/AlignHash' => {
          'EnforcedHashRocketStyle' => 'table',
          'EnforcedColonStyle' => 'key',
          'EnforcedLastArgumentHashStyle' => 'ignore_implicit',
        },
      },
      {
        'Style/AlignHash' => {
          'EnforcedHashRocketStyle' => 'table',
          'EnforcedColonStyle' => 'key',
          'EnforcedLastArgumentHashStyle' => 'ignore_explicit',
        },
      },

      {
        'Style/AlignHash' => {
          'EnforcedHashRocketStyle' => 'table',
          'EnforcedColonStyle' => 'separator',
          'EnforcedLastArgumentHashStyle' => 'always_inspect',
        },
      },
      {
        'Style/AlignHash' => {
          'EnforcedHashRocketStyle' => 'table',
          'EnforcedColonStyle' => 'separator',
          'EnforcedLastArgumentHashStyle' => 'always_ignore',
        },
      },
      {
        'Style/AlignHash' => {
          'EnforcedHashRocketStyle' => 'table',
          'EnforcedColonStyle' => 'separator',
          'EnforcedLastArgumentHashStyle' => 'ignore_implicit',
        },
      },
      {
        'Style/AlignHash' => {
          'EnforcedHashRocketStyle' => 'table',
          'EnforcedColonStyle' => 'separator',
          'EnforcedLastArgumentHashStyle' => 'ignore_explicit',
        },
      },

      {
        'Style/AlignHash' => {
          'EnforcedHashRocketStyle' => 'table',
          'EnforcedColonStyle' => 'table',
          'EnforcedLastArgumentHashStyle' => 'always_inspect',
        },
      },
      {
        'Style/AlignHash' => {
          'EnforcedHashRocketStyle' => 'table',
          'EnforcedColonStyle' => 'table',
          'EnforcedLastArgumentHashStyle' => 'always_ignore',
        },
      },
      {
        'Style/AlignHash' => {
          'EnforcedHashRocketStyle' => 'table',
          'EnforcedColonStyle' => 'table',
          'EnforcedLastArgumentHashStyle' => 'ignore_implicit',
        },
      },
      {
        'Style/AlignHash' => {
          'EnforcedHashRocketStyle' => 'table',
          'EnforcedColonStyle' => 'table',
          'EnforcedLastArgumentHashStyle' => 'ignore_explicit',
        },
      },

    ]

  end
end
