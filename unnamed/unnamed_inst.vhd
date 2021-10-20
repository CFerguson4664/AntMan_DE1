	component unnamed is
		port (
			clk    : in  std_logic                     := 'X';             -- clk
			areset : in  std_logic                     := 'X';             -- reset
			a      : in  std_logic_vector(12 downto 0) := (others => 'X'); -- a
			x      : in  std_logic_vector(11 downto 0) := (others => 'X'); -- x
			y      : in  std_logic_vector(11 downto 0) := (others => 'X'); -- y
			xo     : out std_logic_vector(9 downto 0);                     -- xo
			yo     : out std_logic_vector(9 downto 0)                      -- yo
		);
	end component unnamed;

	u0 : component unnamed
		port map (
			clk    => CONNECTED_TO_clk,    --    clk.clk
			areset => CONNECTED_TO_areset, -- areset.reset
			a      => CONNECTED_TO_a,      --      a.a
			x      => CONNECTED_TO_x,      --      x.x
			y      => CONNECTED_TO_y,      --      y.y
			xo     => CONNECTED_TO_xo,     --     xo.xo
			yo     => CONNECTED_TO_yo      --     yo.yo
		);

