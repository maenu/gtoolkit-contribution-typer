Class {
	#name : #TypInfVariableLookupResult,
	#superclass : #TypVariableLookupResult,
	#category : #'Typer-Inference-Lookup'
}

{ #category : #accessing }
TypInfVariableLookupResult >> type [
	| selector |
	selector := originalLookup selector.
	originalLookup receiverType asCollection
		collect: [ :e | 
			(e isNamed and: [ e hasClassDescription ])
				ifTrue: [ | classDescription |
					classDescription := originalLookup receiverType classDescription.
					(classDescription allInstVarNames includes: selector)
						ifTrue: [ classDescription
								typInfVariableAssignedTypeFor: selector
								nodeClass: RBInstanceVariableNode
								in: classDescription allMethods ]
						ifFalse: [ ((classDescription allClassVariables collect: #key)
								includes: selector)
								ifTrue: [ self flag: '...or we just take the type of the value?'.
									classDescription
										typInfVariableAssignedTypeFor: selector
										nodeClass: RBGlobalNode
										in: classDescription allMethods , classDescription class allMethods ]
								ifFalse: [ TypUnknownType instance ] ] ]
				ifFalse: [ TypUnknownType instance ] ]
]
