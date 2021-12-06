Extension { #name : #OrderedCollection }

{ #category : #'*Typer-Core' }
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