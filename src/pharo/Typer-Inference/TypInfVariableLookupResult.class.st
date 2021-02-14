Class {
	#name : #TypInfVariableLookupResult,
	#superclass : #TypVariableLookupResult,
	#category : #'Typer-Inference-Lookup'
}

{ #category : #accessing }
TypInfVariableLookupResult >> type [
	^ lookup receiverType asCollection
		collect: [ :e | 
			(e isNamed and: [ e hasClassDescription ])
				ifTrue: [ (e allInstVarNames includes: lookup selector)
						ifTrue: [ e
								typInfVariableAssignedTypeFor: lookup selector
								nodeClass: RBInstanceVariableNode
								in: e allMethods ]
						ifFalse: [ ((e allClassVariables collect: #key) includes: lookup selector)
								ifTrue: [ self flag: '...or we just take the type of the value?'.
									e
										typInfVariableAssignedTypeFor: lookup selector
										nodeClass: RBGlobalNode
										in: e allMethods , e class allMethods ]
								ifFalse: [ TypUnknownType new ] ] ]
				ifFalse: [ TypUnknownType new ] ]
]
