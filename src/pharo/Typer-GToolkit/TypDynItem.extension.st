Extension { #name : #TypDynItem }

{ #category : #'*Typer-GToolkit' }
TypDynItem >> typGtAsElement [
	^ BlElement new
		layout: BlLinearLayout horizontal;
		size: 5 asPoint;
		clipChildren: false;
		addChild: (BlElement new
					layout: BlLinearLayout vertical;
					background: self typGtColor;
					size: 5 asPoint;
					geometry: BlRectangleGeometry new;
					yourself)
			as: #icon;
		addChild: (BrLabel new
					aptitude: BrGlamorousLabelAptitude;
					text: (inf asString asRopedText fontSize: 5);
					geometry: (BlRoundedRectangleGeometry cornerRadius: 2);
					relocate: -2 @ -2;
					constraintsDo: [ :c | 
						c ignoredByLayout.
						c vertical exact: 9 ];
					preventMeAndChildrenMouseEvents;
					visibility: BlVisibility hidden;
					yourself)
			as: #labelInf;
		addChild: (BrLabel new
					aptitude: BrGlamorousLabelAptitude;
					text: (dyn asString asRopedText fontSize: 5);
					geometry: (BlRoundedRectangleGeometry cornerRadius: 2);
					relocate: -2 @ -2;
					constraintsDo: [ :c | 
						c ignoredByLayout.
						c vertical exact: 9 ];
					preventMeAndChildrenMouseEvents;
					visibility: BlVisibility hidden;
					yourself)
			as: #labelDyn;
		addChild: (BrLabel new
					aptitude: BrGlamorousLabelAptitude;
					text: (name asString asRopedText fontSize: 5);
					relocate: -2 @ -2;
					constraintsDo: [ :c | 
						c ignoredByLayout.
						c vertical exact: 9 ];
					preventMeAndChildrenMouseEvents;
					visibility: BlVisibility hidden;
					yourself)
			as: #labelName;
		yourself
]

{ #category : #'*Typer-GToolkit' }
TypDynItem >> typGtColor [
	^ self color
]

{ #category : #'*Typer-GToolkit' }
TypDynItem >> typGtGeometry [
	^ self subclassResponsibility
]
