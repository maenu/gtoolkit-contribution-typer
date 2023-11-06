Extension { #name : #Collection }

{ #category : #'*Typer-Core' }
Collection >> typAsMinimizedType [
	<typPraResult: 'TypType'>
	| remains nilTypes unknownTypes voidTypes current |
	remains := self typAsType types.
	remains size = 1 ifTrue: [ ^ remains anyOne ].
	nilTypes := remains select: #isNil.
	unknownTypes := remains select: #isUnknown.
	voidTypes := remains select: #isVoid.
	remains
		removeAll: nilTypes;
		removeAll: unknownTypes;
		removeAll: voidTypes.
	remains size > 1
		ifTrue: [ remains sorted reversed
				reduce: [ :a :b | 
					a > b
						ifTrue: [ remains remove: b.
							a ]
						ifFalse: [ b ] ] ].
	current := remains typAsType.
	unknownTypes
		ifNotEmpty: [ current >= ProtoObject typAsType
				ifTrue: [ remains := IdentitySet with: TypUnknownType instance ]
				ifFalse: [ remains addAll: unknownTypes ] ].
	nilTypes
		ifNotEmpty: [ (current isVoid or: [ (current >= Object typAsType) not ])
				ifTrue: [ remains addAll: nilTypes ] ].
	remains addAll: voidTypes.
	remains size = 1 ifTrue: [ ^ remains anyOne ].
	remains removeAll: voidTypes.
	remains size = 1 ifTrue: [ ^ remains anyOne ].
	^ TypUnionType types: remains
]

{ #category : #'*Typer-Core' }
Collection >> typAsType [
	<typPraResult: 'TypType'>
	| flattened |
	self ifEmpty: [ ^ TypVoidType instance ].
	flattened := IdentitySet new.
	self
		do: [ :e | e isUnion ifTrue: [ flattened addAll: e types ] ifFalse: [ flattened add: e ] ].
	flattened size = 1 ifTrue: [ ^ flattened anyOne ].
	^ TypUnionType types: flattened
]
