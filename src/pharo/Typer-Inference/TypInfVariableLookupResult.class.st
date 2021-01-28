Class {
	#name : #TypInfVariableLookupResult,
	#superclass : #TypVariableLookupResult,
	#category : #'Typer-Inference-Lookup'
}

{ #category : #accessing }
TypInfVariableLookupResult >> type [
	| classDescription selector |
	classDescription := originalLookup receiverType classDescription.
	selector := originalLookup selector.
	(selector first isUppercase
		and: [ (classDescription allClassVariables collect: #key)
				includes: selector ])
		ifTrue: [ self flag: '...or we just take the type of the value?'.
			^ classDescription
				typInfVariableAssignedTypeFor: selector
				nodeClass: RBGlobalNode
				in: classDescription allMethods , classDescription class allMethods ].
	(selector first isLowercase
		and: [ classDescription allInstVarNames includes: selector ])
		ifTrue: [ ^ classDescription
				typInfVariableAssignedTypeFor: selector
				nodeClass: RBInstanceVariableNode
				in: classDescription allMethods ].
	TypNoTypeError signal
]
