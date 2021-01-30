Class {
	#name : #TypInfVariableLookupResult,
	#superclass : #TypVariableLookupResult,
	#category : #'Typer-Inference-Lookup'
}

{ #category : #accessing }
TypInfVariableLookupResult >> type [
	| root selector |
	root := lookup root.
	selector := root selector.
	^ root receiverType asCollection
		collect: [ :e | 
			(e isNamed and: [ e hasClassDescription ])
				ifTrue: [ (e allInstVarNames includes: selector)
						ifTrue: [ e
								typInfVariableAssignedTypeFor: selector
								nodeClass: RBInstanceVariableNode
								in: e allMethods ]
						ifFalse: [ ((e allClassVariables collect: #key) includes: selector)
								ifTrue: [ self flag: '...or we just take the type of the value?'.
									e
										typInfVariableAssignedTypeFor: selector
										nodeClass: RBGlobalNode
										in: e allMethods , e class allMethods ]
								ifFalse: [ TypUnknownType instance ] ] ]
				ifFalse: [ TypUnknownType instance ] ]
]
