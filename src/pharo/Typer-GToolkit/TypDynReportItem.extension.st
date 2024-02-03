Extension { #name : #TypDynReportItem }

{ #category : #'*Typer-GToolkit' }
TypDynReportItem >> typGtAsElement [
	^ BlElement new
		layout: BlLinearLayout vertical;
		background: self typGtColor;
		size: 5 asPoint;
		geometry: self typGtGeometry;
		yourself
]

{ #category : #'*Typer-GToolkit' }
TypDynReportItem >> typGtColor [
	"
	hue ~ 0: no coverage, >0: dyn/inf agreement
	"

	| color error d i |
	color := BrGlamorousColors primaryBorderColor.
	error := BrGlamorousColors errorBorderColor.
	dynReduced := dyn.
	infReduced := inf.
	d := self isUnknown: dynReduced.
	i := self isUnknown: infReduced.
	d & i
		ifTrue: [ ^ Color
				h: error hue - 40
				s: error saturation
				v: error brightness ].
	d
		ifTrue: [ ^ Color
				h: color hue + 40
				s: color saturation
				v: 0.6 ].
	i
		ifTrue: [ ^ Color
				h: color hue - 40
				s: color saturation
				v: 0.6 ].
	dynReduced = infReduced
		ifTrue: [ ^ Color
				h: color hue
				s: color saturation
				v: color brightness ].
	infReduced := inf typDynWithoutUnknown.
	dynReduced = infReduced
		ifTrue: [ ^ Color
				h: color hue
				s: color saturation
				v: color brightness ].
	dynReduced := dyn typDynWithoutUnion.
	infReduced := infReduced typDynWithoutUnion.
	dynReduced = infReduced
		ifTrue: [ ^ Color
				h: color hue
				s: color saturation
				v: color brightness ].
	dynReduced < infReduced
		ifTrue: [ ^ Color
				h: color hue - 20
				s: color saturation
				v: color brightness ].
	dynReduced > infReduced
		ifTrue: [ ^ Color
				h: color hue + 20
				s: color saturation
				v: color brightness ].
	^ error
]

{ #category : #'*Typer-GToolkit' }
TypDynReportItem >> typGtGeometry [
	^ self subclassResponsibility
]
