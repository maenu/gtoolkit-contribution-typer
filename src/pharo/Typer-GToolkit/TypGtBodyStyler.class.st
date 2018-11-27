Class {
	#name : #TypGtBodyStyler,
	#superclass : #GtCoderBodyStyler,
	#category : #'Typer-GToolkit-Core'
}

{ #category : #visiting }
TypGtBodyStyler >> styleFrom: from to: to with: attributes [
	"style only if within body"

	from - patternSource size - 1 <= 0
		ifFalse: [ super styleFrom: from to: to with: attributes ]
]

{ #category : #visiting }
TypGtBodyStyler >> styleValueNode: aNode [
	self
		styleFrom: aNode stop
		to: aNode stop
		with:
			{(TypGtTypeAttribute new
				type:
					([ aNode typType ]
						on: Error
						do: [ Halt now ]);
				yourself)}
]
