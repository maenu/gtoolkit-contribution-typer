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
		typAsFunctionTypeWithResult: (aLookup receiver at: '@A')
]

{ #category : #shadow }
TypShaPhaAssociation >> mValue: aLookup [
	<typShaMethod: 'value'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup receiver at: '@B')
]

{ #category : #accessing }
TypShaPhaAssociation >> resolveType: aLookup [
	^ aLookup root classDescription
		typAsParametricTypeWithParameters:
			{('@A' -> '@A' typAsVariableType).
			('@B' -> '@B' typAsVariableType)} asOrderedDictionary
]
