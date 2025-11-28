module ActiveRecordDumper
  RSpec.describe Dump do
    before do
      allow(ActiveRecord::Base).to receive(:connection).and_return(double('connection').as_null_object)
      allow(ActiveRecord::Base.connection).to receive(:tables).and_return(%w[mytable schema_info schema_migrations])
      allow(ActiveRecord::Base.connection).to receive(:columns).with('mytable').and_return([double('a', name: 'a', type: :string), double('b', name: 'b', type: :string)])
      allow(ActiveRecord::Base.connection).to receive(:select_one).and_return('count' => '2')
      allow(ActiveRecord::Base.connection).to receive(:select_all).and_return([{ 'a' => 1, 'b' => 2 }, { 'a' => 3, 'b' => 4 }])
      allow(Utils).to receive(:quote_table).with('mytable').and_return('mytable')
    end

    before(:each) do
      allow(File).to receive(:open).with('dump.yml', 'w').and_yield(StringIO.new)
      @io = StringIO.new
    end

    it 'returns a formatted string' do
      Dump.table_record_header(@io)
      @io.rewind
      expect(@io.read).to eq("  records:\n")
    end

    it 'returns a yaml string that contains a table header and column names' do
      allow(Dump).to receive(:table_column_names).with('mytable').and_return(%w[a b])
      Dump.dump_table_columns(@io, 'mytable')
      @io.rewind
      expected_yml = <<EOYAML

---
mytable:
  columns:
  - a
  - b
EOYAML
      expect(@io.read).to eq(expected_yml)
    end

    it 'dumps the records for a table in yaml to a given io stream' do
      allow(SerializationHelper::Dump).to receive(:each_table_page).with('mytable').and_yield(
        [{ 'a' => 1, 'b' => 2 }, { 'a' => 3, 'b' => 4 }]
      )
      Dump.dump_table_records(@io, 'mytable')
      @io.rewind
      expected_yml = <<EOYAML
  records:
  - - 1
    - 2
  - - 3
    - 4
EOYAML
      expect(@io.read).to eq(expected_yml)
    end
  end
end
