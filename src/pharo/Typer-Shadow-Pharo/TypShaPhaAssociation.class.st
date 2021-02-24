Class {
	#name : #TypShaPhaAssociation,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaAssociation class >> shadowedClass [
	^ Association class
]

{ #category : #shadow }
TypShaPhaAssociation >> mKey: aLookup [
	<typShaMethod: 'key'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup receiverType at: '@A')
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaPhaAssociation >> mValue: aLookup [
	<typShaMethod: 'value'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup receiverType at: '@B')
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #accessing }
TypShaPhaAssociation >> resolveType: aLookup [
	^ aLookup classDescription
		typAsParametricTypeWithParameters:
			{('@A' -> '@A' typAsVariableType).
			('@B' -> '@B' typAsVariableType)} asOrderedDictionary
]
