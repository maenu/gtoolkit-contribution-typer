Extension { #name : #Collection }

{ #category : #'*Typer-Core' }
Collection >> typAsMinimizedType [
	<typPraResult: 'TypType'>
	| remains nilTypes unknownTypes removeables |
	self ifEmpty: [ ^ TypUnknownType instance ].
	remains := IdentitySet new.
	self
		do: [ :e | e isUnion ifTrue: [ remains addAll: e types ] ifFalse: [ remains add: e ] ].
	nilTypes := remains select: #isNil.
	unknownTypes := remains select: #isUnknown.
	remains
		removeAll: nilTypes;
		removeAll: unknownTypes.
	removeables := IdentitySet new.
	remains
		sorted: [ :a :b | 
			a <= b
				ifTrue: [ removeables add: a.
					true ]
				ifFalse: false ].
	remains removeAll: removeables.
	remains
		addAll: nilTypes;
		addAll: unknownTypes.
	remains size = 1 ifTrue: [ ^ remains anyOne ].
	^ TypUnionType types: remains
]

{ #category : #'*Typer-Core' }
Collection >> typAsType [
	<typPraResult: 'TypType'>
	| flattened |
	self ifEmpty: [ ^ TypUnknownType instance ].
	flattened := IdentitySet new.
	self
		do: [ :e | e isUnion ifTrue: [ flattened addAll: e types ] ifFalse: [ flattened add: e ] ].
	flattened size = 1 ifTrue: [ ^ flattened anyOne ].
	^ TypUnionType types: flattened
]
