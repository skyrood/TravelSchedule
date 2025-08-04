//
//  EnumMapper.swift
//  TravelSchedule
//
//  Created by Rodion Kim on 2025/08/04.
//

enum EnumMapper {
    static func makeEnum<T: RawRepresentable>(from string: String?) -> T? where T.RawValue == String {
        guard let string else { return nil }
        return T(rawValue: string)
    }
}
