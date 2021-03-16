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
	<typMigrated>
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
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {BlShortcut typAsType}
]

{ #category : #shadow }
TypShaGtGtMethodCoderAddOns >> mAddStyler: aLookup [
	<typShaMethod: 'addStyler:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {GtRBASTStyler typAsType}
]

{ #category : #shadow }
TypShaGtGtMethodCoderAddOns >> mStylers: aLookup [
	<typShaMethod: 'stylers'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(SequenceableCollection typAsType
				copyWithParameters: {GtRBASTStyler typAsType})
]

{ #category : #'as yet unclassified' }
TypShaGtGtMethodCoderAddOns >> vModified: aLookup [
	<typShaForVariable: #modified>
	^ Set typAsType copyWithParameters: {Symbol typAsType}
]

{ #category : #accessing }
TypShaGtGtMethodCoderAddOns >> vStylers: aLookup [
	<typShaForVariable: #stylers>
	^ SequenceableCollection typAsType
		copyWithParameters: {GtRBASTStyler typAsType}
]
