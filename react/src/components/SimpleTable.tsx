import styled from '@emotion/styled';

const ScrollableData = styled.div`
  overflow-x: auto;
`;

const Table = styled.table`
  border-collapse: collapse;
  border-spacing: 0;
  border: 1px solid;

  th,
  td {
    border: 1px solid;
    padding: 0.5rem;
    text-align: left;
  }
`;

interface Row {
  label: string;
  value: React.ReactNode;
}

interface SimpleTableProps {
  rows: Row[];
}

export const SimpleTable: React.FC<SimpleTableProps> = (props) => {
  const { rows } = props;

  return (
    <ScrollableData>
      <Table>
        <thead>
          <tr>
            <th scope="col">Label</th>
            <th scope="col">Value</th>
          </tr>
        </thead>
        <tbody>
          {rows.map((row) => (
            <tr key={row.label}>
              <th scope="row">
                <code>{row.label}</code>
              </th>
              <td>
                <code>{row.value}</code>
              </td>
            </tr>
          ))}
        </tbody>
      </Table>
    </ScrollableData>
  );
};
