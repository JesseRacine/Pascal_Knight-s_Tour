program pascalknight;

uses
  SysUtils;

const
  BoardSize = 5;
  SizeMax = BoardSize - 1;
  KnightMoves: array[0..7, 0..1] of integer =
    ((-2, -1), (-1, -2), (1, -2), (2, -1), (2, 1), (1, 2), (-1, 2), (-2, 1));
  SquareCount = BoardSize * BoardSize;



type
  Coordinates = record
    X: integer;
    Y: integer;
  end;
  ChessBoard = array[0..SizeMax, 0..SizeMax] of integer;
 
  var
  Board: ChessBoard;
  Coord: Coordinates;
  Solutions, A, B: integer;



  function IsValid(var C: Coordinates; var B: ChessBoard): boolean;
  begin
    if (C.X > SizeMax) or (C.X < 0) then
      Exit(False);
    if (C.Y > SizeMax) or (C.Y < 0) then
      Exit(False);
    if B[C.X, C.Y] <> 0 then
      Exit(False);

    Result := True;
  end;

  procedure InitArray;
  var
    I: integer;
    J: integer;
  begin
    for I := 0 to SizeMax do
    begin
      for J := 0 to SizeMax do
      begin
        Board[I, J] := 0;
      end;
    end;

  end;

  procedure PrintBoard(var B: ChessBoard);
  var
    I, J : integer;
    S: string;
  begin
    Inc(Solutions);
    writeLn('Solution #' + IntToStr(Solutions));
    for I := 0 to SizeMax do
    begin
      S := '';
      for J := 0 to SizeMax do
      begin
        S := S + format('%2d ', [B[i, j]]);
      end;
      writeLn(S);
    end;

  end;

  procedure GrowSolution(C: Coordinates; var B: ChessBoard; Iter: integer);
  var
    I: integer;
    NewCoord: Coordinates;
  begin
    B[C.X, C.Y] := Iter;
    if Iter = SquareCount then
    begin
      PrintBoard(B);
      B[C.X, C.Y] := 0;
      exit;
    end;
    for I := 0 to 7 do
    begin
      NewCoord.X := C.X + KnightMoves[I, 0];
      NewCoord.Y := C.Y + KnightMoves[I, 1];
      if IsValid(NewCoord, B) then
        GrowSolution(NewCoord, B, Iter + 1);
    end;
    B[C.X, C.Y] := 0;

  end;

begin
  Solutions := 0;
  InitArray();
  for A := 0 to SizeMax do
  begin
    for B := 0 to SizeMax do
        Coord.X := A;
        Coord.Y := B;
        GrowSolution(Coord, Board, 1);
    begin
    end;
  end   ;
  ReadLn;
end.
 
 
