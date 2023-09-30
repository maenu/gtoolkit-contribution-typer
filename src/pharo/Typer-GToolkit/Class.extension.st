Extension { #name : #Class }

{ #category : #'*Typer-GToolkit' }
Class >> typGtElementInPackage: aPackage [
	^ BlElement new
		layout: (BlGridLayout new
				rowCount: 2;
				columnCount: 2;
				cellSpacing: 5;
				yourself);
		constraintsDo: [ :c | 
			c horizontal fitContent.
			c vertical fitContent ];
		border: (BlBorder paint: BrGlamorousColors defaultButtonBorderColor width: 1);
		addChildren: {self instanceSide typGtVariablesElementInPackage: aPackage.
				self classSide typGtVariablesElementInPackage: aPackage.
				self instanceSide typGtCheMethodsElementInPackage: aPackage.
				self classSide typGtCheMethodsElementInPackage: aPackage};
		yourself
]
