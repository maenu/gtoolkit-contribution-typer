Extension { #name : #OrderedCollection }

{ #category : #'*Typer-Core-Utility' }
OrderedCollection >> typDiff: aCollection [

	| selfIndex otherIndex classNames result |
	selfIndex := self
		             collect: [ :e | e analyzedClassName -> e ]
		             as: Dictionary.
	otherIndex := aCollection
		              collect: [ :e | e analyzedClassName -> e ]
		              as: Dictionary.
	classNames := (selfIndex keys , otherIndex keys) asSet.
	result := OrderedCollection new.
	classNames do: [ :e | 
		| selfItem otherItem dItem |
		selfItem := selfIndex at: e ifAbsent: [ SpaceTallyItem typNil: e ].
		otherItem := otherIndex at: e ifAbsent: [ SpaceTallyItem typNil: e ].
		dItem := selfItem typDiff: otherItem.
		dItem typIsZero ifFalse: [ result add: dItem ] ].
	^ result sort: [ :a :b | a spaceForInstances > b spaceForInstances ]
]

{ #category : #'*Typer-Core-Utility' }
OrderedCollection >> typInTyper [

	^ (self select: [ :e | 
		   e analyzedClassName asClass package name beginsWith: 'Typer' ]) 
		  sorted: [ :a :b | a spaceForInstances > b spaceForInstances ]
]
