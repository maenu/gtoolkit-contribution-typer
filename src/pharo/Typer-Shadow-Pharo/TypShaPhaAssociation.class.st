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
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup receiverType at: '@A')
]

{ #category : #shadow }
TypShaPhaAssociation >> mValue: aLookup [
	<typShaMethod: 'value'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup receiverType at: '@B')
]

{ #category : #accessing }
TypShaPhaAssociation >> resolveType: aLookup [
	^ aLookup classDescription
		typAsParametricTypeWithParameters:
			{('@A' -> '@A' typAsVariableType).
			('@B' -> '@B' typAsVariableType)} asOrderedDictionary
]
