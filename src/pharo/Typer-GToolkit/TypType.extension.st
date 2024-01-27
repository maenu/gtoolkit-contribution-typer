Extension { #name : #TypType }

{ #category : #'*Typer-GToolkit' }
TypType class >> gtIndexFor: aView [
	<gtView>
	index ifNil: [ ^ aView empty ].
	^ aView forward
		title: 'Index';
		priority: -2;
		object: [ index ];
		view: #gtItemsFor:
]

{ #category : #'*Typer-GToolkit' }
TypType >> typGtAsResultRopedText [
	^ self typGtAsRopedText
]

{ #category : #'*Typer-GToolkit' }
TypType >> typGtAsRopedText [
	^ self printString asRopedText foreground: BrGlamorousColors fadedTextColor
]
