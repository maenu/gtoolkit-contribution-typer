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
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | 
			i = 1
				ifTrue: [ Symbol typAsType ]
				ifFalse: [ i = 2
						ifTrue: [ Form typAsType ]
						ifFalse: [ BlockClosure
								typAsFunctionTypeWithResult: TypUnknownType new
								arguments: {}
								argumentsOptional: false
								signalsAlways: false ] ] ];
		resultType: [ :a :s :r | 'GtMethodCoderAddOns' typAsType ];
		yourself
]

{ #category : #shadow }
TypShaGtGtMethodCoderAddOns >> mAddShortcut: aLookup [ 
	<typShaMethod: 'addShortcut:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | BlShortcut typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #shadow }
TypShaGtGtMethodCoderAddOns >> mAddStyler: aLookup [ 
	<typShaMethod: 'addStyler:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | GtCoderBodyStyler typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #shadow }
TypShaGtGtMethodCoderAddOns >> mStylers: aLookup [ 
	<typShaMethod: 'stylers'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | 
			SequenceableCollection typAsType
				copyWithParameters: {GtCoderBodyStyler typAsType} ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaGtGtMethodCoderAddOns >> vModified: aLookup [
	<typShaForVariable: #modified>
	^ Set typAsType copyWithParameters: {Symbol typAsType}
]

{ #category : #'as yet unclassified' }
TypShaGtGtMethodCoderAddOns >> vStylers: aLookup [
	<typShaForVariable: #stylers>
	^ SequenceableCollection typAsType
		copyWithParameters: {GtASTStyler typAsType}
]
