Trait {
	#name : #TypInfTFunction,
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfTFunction >> inReturnType [
	| expected actual |
	expected := (self node allChildren select: #isReturn thenCollect: #value)
			asIdentitySet.
	actual := self in
			at: #return
			ifPresent: [ :s | s reject: [ :e | e origin isDead ] thenCollect: #origin ]
			ifAbsent: [ IdentitySet new ].
	^ (expected difference: (actual collect: #node))
		ifEmpty: [ (actual collect: #type) typAsMinimizedType ]
		ifNotEmpty: [ ((actual collect: #type) , {TypUnknownType instance}) typAsMinimizedType ]
]

{ #category : #accessing }
TypInfTFunction >> inSignalType [
	^ self in
		at: #signal
		ifPresent: [ :s | 
			(s reject: [ :e | e origin isDead ])
				ifEmpty: [ nil ]
				ifNotEmpty: [ :ss | (ss collect: #exception) typAsType ] ]
		ifAbsent: [ nil ]
]
