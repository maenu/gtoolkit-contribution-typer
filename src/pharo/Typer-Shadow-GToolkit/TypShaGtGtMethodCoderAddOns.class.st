Class {
	#name : #TypShaGtGtMethodCoderAddOns,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #'as yet unclassified' }
TypShaGtGtMethodCoderAddOns class >> shadowedClass [
	^ GtMethodCoderAddOns class
]

{ #category : #shadow }
TypShaGtGtMethodCoderAddOns >> mAddMainActionIconAction: aLookup [
	<typShaMethod: 'addMainAction:icon:action:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments:
			{Symbol typAsType.
			Form typAsType.
			BlockClosure typAsType}
]

{ #category : #shadow }
TypShaGtGtMethodCoderAddOns >> mAddShortcut: aLookup [
	<typShaMethod: 'addShortcut:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {BlShortcut typAsType}
]

{ #category : #shadow }
TypShaGtGtMethodCoderAddOns >> mAddStyler: aLookup [
	<typShaMethod: 'addStyler:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {GtRBASTStyler typAsType}
]

{ #category : #shadow }
TypShaGtGtMethodCoderAddOns >> mStylers: aLookup [
	<typShaMethod: 'stylers'>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(SequenceableCollection typAsType
				copyWithParameters: {GtRBASTStyler typAsType})
]

{ #category : #'as yet unclassified' }
TypShaGtGtMethodCoderAddOns >> vModified: aLookup [
	<typShaVariable: #modified>
	^ Set typAsType copyWithParameters: {Symbol typAsType}
]

{ #category : #accessing }
TypShaGtGtMethodCoderAddOns >> vStylers: aLookup [
	<typShaVariable: #stylers>
	^ SequenceableCollection typAsType
		copyWithParameters: {GtRBASTStyler typAsType}
]
