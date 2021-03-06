unit Interval;

interface

uses
  System.Classes, System.SysUtils,
  Patterns.Observable;

type
  TInterval = class(TObservable)
  private
    FMinValue: Integer;
    FMaxValue: Integer;
    FLength: Integer;
    procedure calculateLength;
    procedure calculateMaxValue;
  protected
    procedure SetMinValue(Value: Integer);
    procedure SetMaxValue(Value: Integer);
    procedure SetLength(Value: Integer);
  public
    property MinValue: Integer read FMinValue write SetMinValue;
    property MaxValue: Integer read FMaxValue write SetMaxValue;
    property Length: Integer read FLength write SetLength;
  end;

implementation

{ TInterval }

procedure TInterval.SetMinValue(Value: Integer);
begin
  if Value <> FMinValue then
  begin
    FMinValue := Value;
    calculateMaxValue();
    setChanged;
    notifyObservers;
  end;
end;

procedure TInterval.SetMaxValue(Value: Integer);
begin
  if Value <> FMaxValue then
  begin
    FMaxValue := Value;
    calculateLength();
    setChanged;
    notifyObservers;
  end;
end;

procedure TInterval.SetLength(Value: Integer);
begin
  if Value <> FLength then
  begin
    FLength := Value;
    calculateMaxValue;
    setChanged;
    notifyObservers;
  end;
end;

procedure TInterval.calculateMaxValue;
begin
  FMaxValue := MinValue + Length;
end;

procedure TInterval.calculateLength;
begin
  FLength := MaxValue - MinValue;
end;

end.
