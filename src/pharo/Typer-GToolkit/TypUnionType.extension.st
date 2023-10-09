Extension { #name : #TypUnionType }

{ #category : #'*Typer-GToolkit' }
TypUnionType >> typGtAsResultRopedText [
	^ self result typGtAsRopedText
]

{ #category : #'*Typer-GToolkit' }
TypUnionType >> typGtAsRopedText [
	| remains result |
	remains := types copy.
	result := '{' asRopedText foreground: BrGlamorousColors fadedTextColor.
	remains
		detect: #isNil
		ifFound: [ :e | 
			result := result , e typGtAsRopedText.
			remains := remains reject: #isNil.
			remains
				ifNotEmpty: [ result := result , ',' asRopedText
							foreground: BrGlamorousColors fadedTextColor ] ].
	remains
		detect: #isUnknown
		ifFound: [ :e | 
			result := result , e typGtAsRopedText.
			remains := remains reject: #isUnknown.
			remains
				ifNotEmpty: [ result := result , ',' asRopedText
							foreground: BrGlamorousColors fadedTextColor ] ].
	remains size > 1
		ifTrue: [ | type |
			type := remains size = types size
					ifTrue: [ self ]
					ifFalse: [ remains typAsType ].
			(type isUnion and: [ type hasSuper and: [ type super isUnion not ] ])
				ifTrue: [ result := result , type super typGtAsRopedText.
					remains removeAll ] ].
	remains copy
		do: [ :e | 
			result := result , e typGtAsRopedText.
			remains
				remove: e;
				ifNotEmpty: [ result := result , ',' asRopedText
							foreground: BrGlamorousColors fadedTextColor ] ].
	result := result , '}' asRopedText foreground: BrGlamorousColors fadedTextColor.
	^ result
]

{ #category : #'*Typer-GToolkit' }
TypUnionType >> typGtItemsFor: aView [
	<gtView>
	^ aView forward
		title: 'Types';
		priority: 10;
		object: [ types ];
		view: #gtItemsFor:
]
